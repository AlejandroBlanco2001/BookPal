import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/favorite_model.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/usecases/favorites/get_user_favorites.dart';
import 'package:bookpal/domain/usecases/favorites/post_favorite_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {

  final GetUserFavoritesUsecase _getUserFavorites;
  final PostFavoriteUsecase _postFavorite;

  FavoritesBloc(this._getUserFavorites, this._postFavorite) : super(FavoritesInitial()) {
    on<FetchUserFavorites>(onGetUserFavorites);
    on<RefreshFavorites>(onRefreshFavorites);
    on<AddFavorite>(onAddFavorite);
    on<RemoveFavorite>(onRemoveFavorite);
    on<DisposeFavorites>((event, emit) => emit(FavoritesInitial()));
  }

  FutureOr<void> onGetUserFavorites(FetchUserFavorites event, Emitter<FavoritesState> emit) async {
    emit(FetchingFavorites());
    try {
      int? id = JwtDecoder.decode(await getIt.get<SessionManager>().get("jwt"))['id'];
      if (id == null) {
        emit(const FavoritesError.genericError("User id is null"));
        return;
      }
      final dataState = await _getUserFavorites();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(FavoritesFetched(
            dataState.statusCode, dataState.data! as List<FavoriteModel>));
      } else if (dataState is DataFailed) {
        logger.d("DataFailed: ${dataState.error}");
        emit(FavoritesError(dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(FavoritesError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(FavoritesError.genericError(e));
    }
  }

  FutureOr<void> onRefreshFavorites(RefreshFavorites event, Emitter<FavoritesState> emit) async {
    try {
      int? id = JwtDecoder.decode(await getIt.get<SessionManager>().get("jwt"))['id'];
      if (id == null) {
        emit(const FavoritesError.genericError("User id is null"));
        return;
      }
      final dataState = await _getUserFavorites();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(FavoritesFetched(
            dataState.statusCode, dataState.data! as List<FavoriteModel>));
      } else if (dataState is DataFailed) {
        logger.d("DataFailed: ${dataState.error}");
        emit(FavoritesError(dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(FavoritesError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(FavoritesError.genericError(e));
    }
  }

  FutureOr<void> onAddFavorite(AddFavorite event, Emitter<FavoritesState> emit) async {
    FavoriteModel newFavorite = FavoriteModel(
        physicalBookBarcode: event.book.barcode, physicalBook: event.book);
    List<FavoriteModel> rollbackFavorites = state.favoritesList;
    List<FavoriteModel> newFavorites = state.favoritesList..add(newFavorite);
    emit(FavoritesUpdatedTemp(newFavorites));
    try {
      await _postFavorite(params: {
        "physicalBookBarcode": event.book.barcode,
      }).then((dataState) {
        logger.d("Datastate: ${dataState.data}");
        if (dataState is DataSuccess && dataState.data != null) {
          var newFavorites = state.favoritesList
              .map((e) =>
                  (e.physicalBookBarcode == dataState.data!.physicalBookBarcode)
                      ? (dataState.data as FavoriteModel).copyWith(
                          physicalBook: event.book,
                        )
                      : e)
              .toList();
          emit(FavoritesUpdated(newFavorites));
        } else if (dataState is DataFailed) {
          logger.d("DataFailed: ${dataState.error}");
          emit(AddFavoriteError(
              dataState.error!, rollbackFavorites, dataState.statusCode, dataState.message));
        }
      });
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(AddFavoriteError(e, rollbackFavorites));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}.\nStacktrace: ${(e as Error).stackTrace}");
      emit(AddFavoriteError.genericError(e, rollbackFavorites));
    }
  }

  FutureOr<void> onRemoveFavorite(RemoveFavorite event, Emitter<FavoritesState> emit) async {
    List<FavoriteModel> rollbackFavorites = state.favoritesList;
    List<FavoriteModel> newFavorites = state.favoritesList..removeWhere((e) => (e.physicalBookBarcode == event.bookBarcode));
    emit(FavoritesUpdatedTemp(newFavorites));
    try {
      await _postFavorite(params: {
        "physicalBookBarcode": event.bookBarcode,
      }).then((dataState) {
        logger.d("Datastate: ${dataState.data}");
        if (dataState is DataSuccess && dataState.data != null) {
          var newFavorites = state.favoritesList
              .where((e) =>
                  (e.physicalBookBarcode != dataState.data!.physicalBookBarcode))
              .toList();
          emit(FavoritesUpdated(newFavorites));
        } else if (dataState is DataFailed) {
          logger.d("DataFailed: ${dataState.error}");
          emit(RemoveFavoriteError(
              dataState.error!, rollbackFavorites, dataState.statusCode, dataState.message));
        }
      });
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(RemoveFavoriteError(e, rollbackFavorites));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}.\n Stacktrace: ${(e as Error).stackTrace}");
      emit(RemoveFavoriteError.genericError(e, rollbackFavorites));
    }
  }
}
