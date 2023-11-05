import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/user.dart';
import 'package:bookpal/domain/repositories/user_repository.dart';

class UpdateUserUsecase implements Usecase<DataState<User>> {
  final UserRepository _userRepository;

  UpdateUserUsecase(this._userRepository);

  @override
  Future<DataState<User>> call({Map<String, dynamic>? params}) {
    String? email = params!['email'];
    int? id = params['id'];
    Map<String,dynamic> fields = params['fields'];
    if (email != null) {
      return _userRepository.putUserByEmail(email, fields);
    }
    return _userRepository.putUserById(id!, fields);
  }
}
