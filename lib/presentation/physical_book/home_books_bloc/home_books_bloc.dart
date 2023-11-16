import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/usecases/physical_book/get_all_physical_books_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_books_event.dart';
part 'home_books_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {

  final GetAllPhysicalBooksUsecase _getPhysicalBooks;

  HomeBooksBloc(this._getPhysicalBooks) : super(HomeBooksInitial()) {
    on<FetchHomeBooks>(onFetchHomeBooks);
  }

  FutureOr<void> onFetchHomeBooks(FetchHomeBooks event, Emitter<HomeBooksState> emit) async {
    emit(HomeBooksLoading());
    try {
      final dataState =
          await _getPhysicalBooks(params: {'pageSize': 10, 'recents': true});
      if (dataState is DataSuccess && dataState.data != null) {
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
      logger.d('Generic: ${e.toString()}. StackTrace: ${(e as Error).stackTrace.toString()}');
      emit(HomeBooksError.genericError(e));
    }
  }
}
