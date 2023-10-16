

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/domain/repositories/fine_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class FineRepositoryImplementation implements FineRepository {

  final ApiService _apiService;

  FineRepositoryImplementation(this._apiService);

  @override
  Future<DataState<Fine>> getFine(String id) async {
    try {
      final httpResponse = await _apiService.getFine(
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
      final httpResponse = await _apiService.getFinesByUser(
        userId: userId,
      );
      final ResponseVerifier<List<Fine>> responseVerifier = ResponseVerifier<List<Fine>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}