import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<User>> getUser(String id);
}