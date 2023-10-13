

import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';

class ModifyUserUsecase implements Usecase<DataState<User>> {
  final UserRepository _userRepository;

  ModifyUserUsecase(this._userRepository);

  @override
  Future<DataState<User>> call({Map<String, dynamic>? params}) {
    String identifier = params!['id'] ?? params['email'];
    User user = params['user'];
    if (identifier.contains('@')) {
      return _userRepository.putUserById(identifier, user);
    }
    return _userRepository.putUserByEmail(identifier, user);
  }
}