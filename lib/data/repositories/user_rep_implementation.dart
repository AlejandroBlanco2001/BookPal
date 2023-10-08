import 'package:bookpal/data/models/User.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<DataState<UserModel>> getUser() {
    throw UnimplementedError();
  }
}
