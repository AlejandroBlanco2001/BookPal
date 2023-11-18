import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/usecases/physical_book/get_all_physical_books_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final GetAllPhysicalBooksUsecase _getAllPhysicalBooksUsecase;

  SearchBloc(this._getAllPhysicalBooksUsecase) : super(SearchInitial()) {
    on<Search>(onSearch);
  }

  FutureOr<void> onSearch(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final dataState = await _getAllPhysicalBooksUsecase(params: {'title': event.query});
      if (dataState is DataSuccess && dataState.data != null) {
        emit(SearchLoaded(dataState.statusCode, dataState.data! as List<PhysicalBookModel>, event.query));
      } else if (dataState is DataFailed) {
        logger.d("DataFailed: ${dataState.message}");
        emit(SearchError(dataState.error!, event.query, dataState.statusCode, dataState.message));
      }
    } on DioException catch (e) {
      logger.d("DioException: ${e.response}");
      emit(SearchError(e, event.query, e.response?.statusCode));
    } on Error catch (e) {
      logger.d("Generic Error Message: ${e.toString()}.\nStackTrace: ${e.stackTrace.toString()}");
      emit(SearchError.genericError(e, event.query));
    }
  }
}
