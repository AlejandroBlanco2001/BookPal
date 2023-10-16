

import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';

class RegisterUserUsecase implements Usecase<DataState<User>> {

  final UserRepository _userRepository;

  RegisterUserUsecase(this._userRepository);

  @override
  Future<DataState<User>> call({Map<String, dynamic>? params}) {
    User user = params!['user'];
    return _userRepository.postUser(user);
  }
}