

import 'package:bookpal/core/resources/data_state.dart';

abstract class AuthenticationRepository {
  Future<DataState<Map<String, dynamic>>> login(Map<String, String> credentials);
  Future<bool> isLoggedIn();
}