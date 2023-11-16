import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/usecases/physical_book/get_physical_book_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_books_event.dart';
part 'home_books_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {

  final GetPhysicalBookUsecase _getPhysicalBooks;

  HomeBooksBloc(this._getPhysicalBooks) : super(HomeBooksInitial()) {
    on<FetchHomeBooks>(onFetchHomeBooks);
  }

  FutureOr<void> onFetchHomeBooks(FetchHomeBooks event, Emitter<HomeBooksState> emit) async {
    emit(HomeBooksLoading());
    try {
      final dataState =
          await _getPhysicalBooks(params: {'pageSize': 10});
      if (dataState is DataSuccess && dataState.data != null) {
        logger.d('DataSuccess: $dataState');
        emit(HomeBooksLoaded(
            dataState.statusCode, dataState.data! as List<PhysicalBookModel>));
      } else if (dataState is DataFailed) {
        logger.d('DataFailed: $dataState');
        emit(HomeBooksError(dataState.error!, dataState.statusCode));
      }
    } on DioException catch (e) {
      logger.d('DioE: ${e.toString()}');
      emit(HomeBooksError(e, e.response?.statusCode));
    } catch (e) {
      logger.d('Generic: ${e.toString()}');
      emit(HomeBooksError.genericError(e));
    }
  }
}
