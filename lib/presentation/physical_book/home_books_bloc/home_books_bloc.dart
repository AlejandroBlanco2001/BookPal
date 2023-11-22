import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/usecases/physical_book/get_all_physical_books_usecase.dart';
import 'package:bookpal/domain/usecases/physical_book/get_physical_book_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_books_event.dart';
part 'home_books_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {

  final GetPhysicalBookUsecase _getPhysicalBook;
  final GetAllPhysicalBooksUsecase _getPhysicalBooks;

  HomeBooksBloc(this._getPhysicalBooks, this._getPhysicalBook) : super(HomeBooksInitial()) {
    on<FetchHomeBooks>(onFetchHomeBooks);
    on<RefreshHomeBooks>(onRefreshHomeBooks);
    on<RefreshHomeBook>(onRefreshHomeBook);
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

  FutureOr<void> onRefreshHomeBooks(RefreshHomeBooks event, Emitter<HomeBooksState> emit) async {
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

  FutureOr<void> onRefreshHomeBook(RefreshHomeBook event, Emitter<HomeBooksState> emit) async {
    var homeBooks = state.allBooks;
    try {
      await _getPhysicalBook(params: {
        'barcode': event.bookBarcode
      }).then((dataState) {
        logger.d("Datastate: ${dataState.data}");
        if (dataState is DataSuccess && dataState.data != null) {
          var refreshedHomeBooks = homeBooks
              .map((e) => (e.id == dataState.data!.id)
                  ? dataState.data! as PhysicalBookModel
                  : e)
              .toList();
          emit(HomeBooksUpdated(refreshedHomeBooks, dataState.statusCode));
        } else if (dataState is DataFailed) {
          logger.d("DataFailed: ${dataState.error}");
          emit(RefreshHomeBookError(dataState.error!, homeBooks,
              dataState.statusCode, dataState.message));
        }
      });
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(RefreshHomeBookError(e, homeBooks, e.response?.statusCode));
    } catch (e) {
      logger.d("Generic Error Message: ${e.toString()}");
      emit(RefreshHomeBookError.fromGenericError(e, homeBooks));
    }
  }
}
