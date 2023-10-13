import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';

class GetUserUsecase implements Usecase<DataState<User>> {
  final UserRepository _userRepository;

  GetUserUsecase(this._userRepository);
  @override
  Future<DataState<User>> call({Map<String, dynamic>? params}) {
    String identifier = params!['id'] ?? params['email'];
    if (identifier.contains('@')) {
      return _userRepository.getUserByEmail(identifier);
    }
    return _userRepository.getUserById(identifier);
  }
}