
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/book_model.dart';
import 'package:bookpal/domain/repositories/book_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class BookRepositoryImplementation implements BookRepository {

  final ApiService _apiService;

  BookRepositoryImplementation(this._apiService);

  @override
  Future<DataState<BookModel>> getBook(String barcode) async{
    try {
      final httpResponse = await _apiService.getBook(
        barcode: barcode,
      );

      final ResponseVerifier<BookModel> responseVerifier = ResponseVerifier<BookModel>();

      return responseVerifier.validateResponse(httpResponse);

    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<BookModel>>> getBooks() async{
    try {
      final httpResponse = await _apiService.getBooks();

      final ResponseVerifier<List<BookModel>> responseVerifier = ResponseVerifier<List<BookModel>>();

      return responseVerifier.validateResponse(httpResponse);

    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}