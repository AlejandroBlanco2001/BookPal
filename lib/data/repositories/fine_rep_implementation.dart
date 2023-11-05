

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/util/response_verifier.dart';
import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/domain/repositories/fine_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class FineRepositoryImplementation implements FineRepository {

  final ApiService _apiService;

  FineRepositoryImplementation(this._apiService);

  @override
  Future<DataState<Fine>> getFine(int id) async {
    try {
      final httpResponse = await _apiService.getFine(
        id: id,
      );
      final ResponseVerifier<Fine> responseVerifier = ResponseVerifier<Fine>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e.response?.statusCode ?? 500, e, e.response?.data['message'] ?? "No message");
    }
  }

  @override
  Future<DataState<List<Fine>>> getFinesByUser(int userId) async {
    try {
      final httpResponse = await _apiService.getFinesByUser(
        userId: userId,
      );
      final ResponseVerifier<List<Fine>> responseVerifier = ResponseVerifier<List<Fine>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e.response?.statusCode ?? 500, e, e.response?.data['message'] ?? "No message");
    }
  }
}