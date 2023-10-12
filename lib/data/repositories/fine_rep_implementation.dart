

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/domain/repositories/fine_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class FineRepositoryImplementation implements FineRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  FineRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<Fine>> getFine(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getFine(
        id: id,
      );
      final ResponseVerifier<Fine> responseVerifier = ResponseVerifier<Fine>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<Fine>>> getFinesByUser(String userId) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getFinesByUser(
        userId: userId,
      );
      final ResponseVerifier<List<Fine>> responseVerifier = ResponseVerifier<List<Fine>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}