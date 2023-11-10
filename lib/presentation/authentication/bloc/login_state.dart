part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  final Map<String, dynamic>? jwt;
  final int? statusCode;
  final dynamic genericError;
  final DioException? dioError;
  final List<String>? message;

  const LoginState({
    this.jwt,
    this.statusCode,
    this.genericError,
    this.dioError,
    this.message = const [],
  });

  @override
  List<Object?> get props => [
        jwt,
        statusCode,
        dioError,
        message,
      ];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoggingOut extends LoginState {}

final class LoginSuccess extends LoginState {
  const LoginSuccess(
    int statusCode,
    Map<String, dynamic> jwt
  ) : super(
          statusCode: statusCode,
          jwt: jwt,
        );

  @override
  List<Object?> get props => [statusCode, jwt];
}

final class LoginError extends LoginState {
  const LoginError(
    DioException dioError,
    [int? statusCode,
    List<String>? message,]
  ) : super(
          statusCode: statusCode,
          dioError: dioError,
          message: message,
        );

  const LoginError.genericError(dynamic genericError) : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, message];
}
