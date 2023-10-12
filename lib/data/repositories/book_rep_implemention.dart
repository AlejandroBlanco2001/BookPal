
import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/book_model.dart';
import 'package:bookpal/domain/repositories/book_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class BookRepositoryImplementation implements BookRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  BookRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<BookModel>> getBook(String id) async{
    try {
      final httpResponse = await _generalDatabaseApiService.getBook(
        id: id,
      );

      final ResponseVerifier<BookModel> responseVerifier = ResponseVerifier<BookModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}