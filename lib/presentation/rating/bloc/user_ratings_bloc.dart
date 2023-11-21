import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/rating_model.dart';
import 'package:bookpal/domain/usecases/rating/get_user_ratings.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'user_ratings_event.dart';
part 'user_ratings_state.dart';

class UserRatingsBloc extends Bloc<UserRatingsEvent, UserRatingsState> {
  final GetUserRatingsUsecase _getUserRatingsUsecase;

  UserRatingsBloc(this._getUserRatingsUsecase) : super(UserRatingsInitial()) {
    on<FetchUserRatings>(onFetchUserRatings);
    on<RefreshUserRatings>(onRefreshUserRatings);
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
}
