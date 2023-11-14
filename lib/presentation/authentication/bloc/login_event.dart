part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class InitLogin extends LoginEvent {}

final class Login extends LoginEvent {
  final String email;
  final String password;

  const Login(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

final class Logout extends LoginEvent {}