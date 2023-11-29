part of 'remote_user_bloc.dart';

sealed class RemoteUserState extends Equatable {
  final UserModel? user;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const RemoteUserState(
      {this.user,
      this.dioError,
      this.genericError,
      this.statusCode,
      this.message});

  @override
  List<Object?> get props =>
      [user, dioError, genericError, statusCode, message];
}

final class RemoteUserInitial extends RemoteUserState {}

final class RemoteUserLoading extends RemoteUserState {}

final class RegisteringUser extends RemoteUserState {}

final class RemoteUserLoaded extends RemoteUserState {
  const RemoteUserLoaded(int statusCode, UserModel user)
      : super(statusCode: statusCode, user: user);

  @override
  List<Object?> get props => [statusCode, user];
}

final class RemoteUserUpdated extends RemoteUserState {
  const RemoteUserUpdated(int statusCode, UserModel user)
      : super(statusCode: statusCode, user: user);

  @override
  List<Object?> get props => [statusCode, user];
}

final class RemoteUserRegistered extends RemoteUserState {
  const RemoteUserRegistered(int statusCode, UserModel user)
      : super(statusCode: statusCode, user: user);

  @override
  List<Object?> get props => [statusCode, user];
}

final class RemoteUserError extends RemoteUserState {
  const RemoteUserError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(
          statusCode: statusCode,
          dioError: dioError,
          message: message,
        );
  const RemoteUserError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [dioError, genericError, statusCode, message];
}

final class RegisterUserError extends RemoteUserState {
  const RegisterUserError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(
          statusCode: statusCode,
          dioError: dioError,
          message: message,
        );
  const RegisterUserError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [dioError, genericError, statusCode, message];
}
