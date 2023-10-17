part of 'remote_user_bloc.dart';

sealed class RemoteUserEvent extends Equatable {
  const RemoteUserEvent();

  @override
  List<Object> get props => [];
}

final class GetUser extends RemoteUserEvent {
  final String identifier;

  const GetUser(this.identifier);

  @override
  List<Object> get props => [identifier];
}

final class UpdateUser extends RemoteUserEvent {
  final String identifier;
  final UserModel user;

  const UpdateUser(this.identifier, this.user);

  @override
  List<Object> get props => [identifier, user];
}

final class RegisterUser extends RemoteUserEvent {
  final UserModel user;

  const RegisterUser(this.user);

  @override
  List<Object> get props => [user];
}