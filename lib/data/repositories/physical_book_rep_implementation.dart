

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class PhysicalBookRepositoryImplementation implements PhysicalBookRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  PhysicalBookRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<PhysicalBookModel>> getPhysicalBook(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getPhysicalBook(
        id: id,
      );
      final ResponseVerifier<PhysicalBookModel> responseVerifier = ResponseVerifier<PhysicalBookModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}