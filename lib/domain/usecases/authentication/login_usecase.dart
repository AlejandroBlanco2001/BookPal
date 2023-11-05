


import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/repositories/authentication_repository.dart';

class LoginUsecase implements Usecase<DataState<Map<String,dynamic>>> {
  final AuthenticationRepository _authenticationRepository;

  LoginUsecase(this._authenticationRepository);

  @override
  Future<DataState<Map<String,dynamic>>> call({Map<String, dynamic>? params}) async {

    Map<String, String> credentials = params!.map((key, value) => MapEntry(key, value.toString()));
    
    final loginData = await _authenticationRepository.login(credentials);
    return loginData;
  }
}