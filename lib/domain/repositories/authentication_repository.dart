

import 'package:bookpal/core/resources/data_state.dart';

abstract class AuthenticationRepository {
  Future<DataState<Map<String, dynamic>>> login(String email, String password);
  Future<DataState> logout();
  Future<DataState<bool>> isLoggedIn();
}