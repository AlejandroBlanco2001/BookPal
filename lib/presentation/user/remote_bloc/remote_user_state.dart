part of 'remote_user_bloc.dart';

sealed class RemoteUserState extends Equatable {

  final UserModel? user;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;

  const RemoteUserState({this.user, this.dioError, this.genericError, this.statusCode = 200});
  
  @override
  List<Object?> get props => [user, dioError, statusCode];
}

final class RemoteUserInitial extends RemoteUserState {}

final class RemoteUserLoading extends RemoteUserState {}

final class RemoteUserLoaded extends RemoteUserState {
  const RemoteUserLoaded(int statusCode, UserModel user) : super(statusCode: statusCode, user: user);

  @override
  List<Object?> get props => [statusCode, user];
}

final class RemoteUserUpdated extends RemoteUserState {
  const RemoteUserUpdated(int statusCode, UserModel user) : super(statusCode: statusCode, user: user);

  @override
  List<Object?> get props => [statusCode, user];
}

final class RemoteUserRegistered extends RemoteUserState {
  const RemoteUserRegistered(int statusCode, UserModel user) : super(statusCode: statusCode, user: user);

  @override
  List<Object?> get props => [statusCode, user];
}

final class RemoteUserError extends RemoteUserState {
  const RemoteUserError(DioException dioError, [int? statusCode]) : super(statusCode: statusCode, dioError: dioError);
  const RemoteUserError.genericError(dynamic genericError) : super(genericError: genericError);
  
  @override
  List<Object?> get props => [statusCode, dioError];
}

