import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<User>> getUser(String id);
}