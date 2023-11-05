import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<User>> postUser(User user);
  Future<DataState<User>> getUserById(int id);
  Future<DataState<User>> getUserByEmail(String email);
  Future<DataState<User>> putUserById(int id, Map<String,dynamic> fields);
  Future<DataState<User>> putUserByEmail(String email, Map<String,dynamic> fields);
  // Future<DataState<User>> deleteUser(int id);
}