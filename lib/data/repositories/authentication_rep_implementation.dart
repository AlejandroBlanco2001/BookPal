
import 'dart:io';

import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/domain/repositories/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {

  // ignore: unused_field
  final ApiService _apiService;

  AuthenticationRepositoryImplementation(this._apiService);

  @override
  Future<DataState<Map<String,dynamic>>> login(String email, String password) async {
    try {
      final httpResponse = await _apiService.login(
        email: email,
        password: password,
      );
      if (httpResponse.response.statusCode != HttpStatus.ok){
        return DataFailed(
          httpResponse.response.statusCode!,
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
          ));
      }
      return DataSuccess(httpResponse.response.statusCode!, JwtDecoder.decode(httpResponse.data['access_token']));
    } on DioException catch (e) {
      final DataFailed fail = DataFailed(500, e);
      logger.e(fail);
      return DataFailed(500, e);
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