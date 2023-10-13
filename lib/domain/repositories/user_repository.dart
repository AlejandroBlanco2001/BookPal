import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<User>> postUser(User user);
  Future<DataState<User>> getUserById(String id);
  Future<DataState<User>> getUserByEmail(String email);
  Future<DataState<User>> putUserById(String id, User user);
  Future<DataState<User>> putUserByEmail(String email, User user);
  // Future<DataState<User>> deleteUser(String id);
}