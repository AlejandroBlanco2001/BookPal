

import 'package:bookpal/core/resources/data_state.dart';

abstract class AuthenticationRepository {
  Future<DataState> login(String email, String password);
  Future<DataState> logout();
  Future<DataState<bool>> isLoggedIn();
}