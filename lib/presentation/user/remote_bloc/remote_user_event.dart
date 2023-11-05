part of 'remote_user_bloc.dart';

sealed class RemoteUserEvent extends Equatable {
  const RemoteUserEvent();

  @override
  List<Object> get props => [];
}

final class InitUser extends RemoteUserEvent {}

final class GetUser extends RemoteUserEvent {
  final dynamic identifier;

  const GetUser(this.identifier);

  @override
  List<Object> get props => [identifier];
}

final class UpdateUser extends RemoteUserEvent {
  final int identifier;
  final Map<String,dynamic> fields;

  const UpdateUser(this.identifier, this.fields);

  @override
  List<Object> get props => [identifier, fields];
}

final class RegisterUser extends RemoteUserEvent {
  final UserModel user;

  const RegisterUser(this.user);

  @override
  List<Object> get props => [user];
}