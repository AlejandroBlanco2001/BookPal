import 'dart:io';

import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/domain/repositories/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  // ignore: unused_field
  final ApiService _apiService;

  AuthenticationRepositoryImplementation(this._apiService);

  @override
  Future<DataState<Map<String, dynamic>>> login(
      Map<String, String> credentials) async {
    try {
      final httpResponse = await _apiService.login(credentials: credentials);
      if (httpResponse.response.statusCode != HttpStatus.ok) {
        return DataFailed(
            httpResponse.response.statusCode!,
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              type: DioExceptionType.badResponse,
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
            ),
            httpResponse.response.data['message'] ?? "No message");
      }
      var decodedJwt = JwtDecoder.decode(httpResponse.data['access_token']);
      decodedJwt['name'] = '${decodedJwt['first_name']} ${decodedJwt['last_name']}';
      decodedJwt.remove('first_name');
      decodedJwt.remove('last_name');
      return DataSuccess(httpResponse.response.statusCode!, {
        'raw_jwt': httpResponse.data['access_token'],
        'decoded_jwt': decodedJwt
      });
    } on DioException catch (e) {
      logger.d(e.response?.data);
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    String? jwt = await getIt.get<SessionManager>().get("jwt");
    if (jwt == null || jwt.isEmpty) return false;
    return !JwtDecoder.isExpired(jwt);
  }
}
