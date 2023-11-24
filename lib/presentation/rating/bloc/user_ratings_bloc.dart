import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/rating_model.dart';
import 'package:bookpal/domain/usecases/rating/get_user_ratings.dart';
import 'package:bookpal/domain/usecases/rating/rate_book.dart';
import 'package:bookpal/domain/usecases/rating/update_rating.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_ratings_event.dart';
part 'user_ratings_state.dart';

class UserRatingsBloc extends Bloc<UserRatingsEvent, UserRatingsState> {
  final RateBookUsecase _rateBookUsecase;
  final UpdateRatingUsecase _updateRatingUsecase;
  final GetUserRatingsUsecase _getUserRatingsUsecase;

  UserRatingsBloc(this._getUserRatingsUsecase, this._rateBookUsecase,
      this._updateRatingUsecase)
      : super(UserRatingsInitial()) {
    on<FetchUserRatings>(onFetchUserRatings);
    on<RefreshUserRatings>(onRefreshUserRatings);
    on<RateBook>(onRatebook);
    on<UpdateRating>(onUpdateRating);
    on<DisposeUserRatings>((event, emit) => emit(UserRatingsInitial()));
  }

  FutureOr<void> onFetchUserRatings(
      FetchUserRatings event, Emitter<UserRatingsState> emit) async {
    emit(FetchingUserRatings());
    try {
      final dataState = await _getUserRatingsUsecase();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(UserRatingsFetched(dataState.statusCode,
            dataState.data!.map((e) => e as RatingModel).toList()));
      } else if (dataState is DataFailed) {
        logger.d("DataFailed: ${dataState.error}");
        emit(UserRatingsError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(UserRatingsError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(UserRatingsError.fromGenericError(e));
    }
  }

  FutureOr<void> onRefreshUserRatings(
      RefreshUserRatings event, Emitter<UserRatingsState> emit) async {
    try {
      final dataState = await _getUserRatingsUsecase();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(UserRatingsFetched(dataState.statusCode,
            dataState.data!.map((e) => e as RatingModel).toList()));
      } else if (dataState is DataFailed) {
        logger.d("DataFailed: ${dataState.error}");
        emit(UserRatingsError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(UserRatingsError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(UserRatingsError.fromGenericError(e));
    }
  }

  FutureOr<void> onRatebook(
      RateBook event, Emitter<UserRatingsState> emit) async {
    logger.d("Event: ${event.barcode}. Rating: ${event.rating}");
    RatingModel newRating =
        RatingModel(rating: event.rating, physicalBookBarcode: event.barcode);
    List<RatingModel> rollbackRatings = state.userRatings;
    List<RatingModel> newRatings = state.userRatings..add(newRating);
    emit(UserRatingsUpdatedTemp(newRatings));
    try {
      await _rateBookUsecase(params: {
        'fields': {
          'rating': event.rating,
          'physical_book_barcode': event.barcode,
        }
      }).then((dataState) {
        logger.d("Datastate: ${dataState.data}");
        if (dataState is DataSuccess && dataState.data != null) {
          var newRatings = state.userRatings
              .map((e) =>
                  (e.physicalBookBarcode == dataState.data!.physicalBookBarcode)
                      ? dataState.data! as RatingModel
                      : e)
              .toList();
          newRatings.sort((a, b) => b.rating.compareTo(a.rating));
          emit(UserRatingsUpdated(newRatings, dataState.statusCode));
        } else if (dataState is DataFailed) {
          logger.d("DataFailed: ${dataState.error}");
          emit(UpdateRatingError(dataState.error!, rollbackRatings,
              dataState.statusCode, dataState.message));
        }
      });
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(UpdateRatingError(e, rollbackRatings, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(UpdateRatingError.fromGenericError(e, rollbackRatings));
    }
  }

  FutureOr<void> onUpdateRating(
      UpdateRating event, Emitter<UserRatingsState> emit) async {
    var newRating = state.userRatings
        .firstWhere((r) => r.id == event.ratingId)
        .copyWith(rating: event.rating);
    var newRatings = state.userRatings
        .map((e) => (e.id == newRating.id) ? newRating : e)
        .toList();
    List<RatingModel> rollbackRatings = state.userRatings;
    emit(UserRatingsUpdatedTemp(newRatings));
    try {
      await _updateRatingUsecase(params: {
        'id': event.ratingId,
        'fields': {'rating': event.rating}
      }).then((dataState) {
        logger.d("Datastate: ${dataState.data}");
        if (dataState is DataSuccess && dataState.data != null) {
          var newRatings = state.userRatings
              .map((e) => (e.id == dataState.data!.id)
                  ? dataState.data! as RatingModel
                  : e)
              .toList();
          newRatings.sort((a, b) => b.rating.compareTo(a.rating));
          emit(UserRatingsUpdated(newRatings, dataState.statusCode));
        } else if (dataState is DataFailed) {
          logger.d("DataFailed: ${dataState.error}");
          emit(UpdateRatingError(dataState.error!, rollbackRatings,
              dataState.statusCode, dataState.message));
        }
      });
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(UpdateRatingError(e, rollbackRatings, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(UpdateRatingError.fromGenericError(e, rollbackRatings));
    }
  }
}
