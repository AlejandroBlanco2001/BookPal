import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';

class GetUserUsecase implements Usecase<DataState<User>> {
  final UserRepository _userRepository;

  GetUserUsecase(this._userRepository);
  @override
  Future<DataState<User>> call({Map<String, dynamic>? params}) {
    String? email = params!['email'];
    int? id = params['id'];
    if (email != null) {
      return _userRepository.getUserByEmail(email);
    }
    return _userRepository.getUserById(id!);
  }
}