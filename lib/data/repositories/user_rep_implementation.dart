import 'package:bookpal/data/models/user_model.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<DataState<UserModel>> getUser() {
    throw UnimplementedError();
  }
}
