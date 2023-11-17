import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/rating_model.dart';
import 'package:bookpal/domain/entities/rating.dart';
import 'package:bookpal/domain/usecases/rating/rate_book.dart';
import 'package:bookpal/domain/usecases/rating/update_rating.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final RateBookUsecase _rateBookUsecase;
  final UpdateRatingUsecase _updateRatingUsecase;

  RatingBloc(this._rateBookUsecase, this._updateRatingUsecase)
      : super(RatingInitial()) {
    on<RateBook>(onRatebook);
    on<UpdateRating>(onUpdateRating);
  }

  FutureOr<void> onRatebook(RateBook event, Emitter<RatingState> emit) async {
    emit(RatingLoading());
    try {
      final dataState = await _rateBookUsecase(params: {
        'rating': RatingModel(
            physicalBookBarcode: event.barcode, rating: event.rating)
      });
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RatingCreated(dataState.statusCode, dataState.data!));
      } else if (dataState is DataFailed) {
        emit(RatingError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(RatingError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(RatingError.genericError(e));
    }
  }

  FutureOr<void> onUpdateRating(
      UpdateRating event, Emitter<RatingState> emit) async {
    emit(RatingLoading());
    try {
      final dataState = await _updateRatingUsecase(params: {
        'id': event.bookId,
        'fields': {'rating': event.rating}
      });
      if (dataState is DataSuccess && dataState.data != null) {
        emit(RatingUpdated(dataState.statusCode, dataState.data!));
      } else if (dataState is DataFailed) {
        emit(RatingError(
            dataState.error!, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(RatingError(e, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(RatingError.genericError(e));
    }
  }
}
