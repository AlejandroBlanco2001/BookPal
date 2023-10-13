
import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/book_model.dart';
import 'package:bookpal/domain/repositories/book_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class BookRepositoryImplementation implements BookRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  BookRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<BookModel>> getBook(String barcode) async{
    try {
      final httpResponse = await _generalDatabaseApiService.getBook(
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
      final httpResponse = await _generalDatabaseApiService.getBooks();

      final ResponseVerifier<List<BookModel>> responseVerifier = ResponseVerifier<List<BookModel>>();

      return responseVerifier.validateResponse(httpResponse);

    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}