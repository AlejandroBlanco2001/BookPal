

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/reference_model.dart';
import 'package:bookpal/domain/repositories/reference_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class ReferenceRepositoryImplementation implements ReferenceRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  ReferenceRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<ReferenceModel>> getReference(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getReference(
        id: id,
      );
      final ResponseVerifier<ReferenceModel> responseVerifier = ResponseVerifier<ReferenceModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}