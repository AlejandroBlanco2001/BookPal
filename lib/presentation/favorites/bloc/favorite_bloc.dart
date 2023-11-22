import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/favorite_model.dart';
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
  // ignore: unused_field
  final PostFavoriteUsecase _postFavorite;

  FavoritesBloc(this._getUserFavorites, this._postFavorite) : super(FavoritesInitial()) {
    on<GetUserFavorites>(onGetUserFavorites);
    on<RefreshFavorites>(onRefreshFavorites);
    // on<AddFavorite>(onAddFavorite);
    // on<RemoveFavorite>(onRemoveFavorite);
    on<DisposeFavorites>((event, emit) => emit(FavoritesInitial()));
  }

  FutureOr<void> onGetUserFavorites(GetUserFavorites event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    try {
      int? id = JwtDecoder.decode(await getIt.get<SessionManager>().get("jwt"))['id'];
      if (id == null) {
        emit(const FavoritesError.genericError("User id is null"));
        return;
      }
      final dataState = await _getUserFavorites();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(FavoritesLoaded(
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
        emit(FavoritesLoaded(
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
}
