

import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/domain/repositories/authentication_repository.dart';
import 'package:dio/dio.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {

  // ignore: unused_field
  final ApiService _apiService;

  AuthenticationRepositoryImplementation(this._apiService);

  @override
  Future<DataState> login(String email, String password) async {
    try {
      final httpResponse = await _apiService.login(
        email: email,
        password: password,
      );
      final ResponseVerifier responseVerifier = ResponseVerifier();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<void>> logout() {
    // _apiService.logout();
    throw UnimplementedError();
  }

  @override
  Future<DataState<bool>> isLoggedIn() {
    // Check JWT
    throw UnimplementedError();
  }
}