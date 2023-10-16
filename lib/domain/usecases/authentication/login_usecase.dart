

import 'dart:convert';

import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/repositories/authentication_repository.dart';
import 'package:logger/logger.dart';

class LoginUsecase implements Usecase<Map<String,dynamic>> {
  final AuthenticationRepository _authenticationRepository;
  final Logger _logger;

  LoginUsecase(this._authenticationRepository, this._logger);

  @override
  Future<Map<String,dynamic>> call({Map<String, dynamic>? params}) async {
    
    String email = params!['email'];
    String password = params['password'];
    final loginData = await _authenticationRepository.login(email, password);
    if (loginData is DataSuccess) {
      Map<String, dynamic> jsonResponse = jsonDecode(loginData.data);
      _logger.i('Login successful. Response: $jsonResponse');
      return jsonResponse['token'];
    } else {
      _logger.e('Login failed');
      return jsonDecode(jsonEncode(loginData.error));
    }
  }
}