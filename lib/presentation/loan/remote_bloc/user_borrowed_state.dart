part of 'user_borrowed_bloc.dart';

sealed class UserBorrowedState extends Equatable {

  final List<LoanModel>? userLoans;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const UserBorrowedState(
      {this.userLoans,
      this.dioError,
      this.genericError,
      this.statusCode,
      this.message});
  
  @override
  List<Object?> get props => [userLoans, dioError, genericError, statusCode];
}

final class UserBorrowedInitial extends UserBorrowedState {}

final class UserBorrowedLoading extends UserBorrowedState {}

final class UserBorrowedLoaded extends UserBorrowedState {
  const UserBorrowedLoaded(int statusCode, List<LoanModel> userLoans)
      : super(statusCode: statusCode, userLoans: userLoans);

  @override
  List<Object?> get props => [statusCode, userLoans];
}

final class UserBorrowedError extends UserBorrowedState {
  const UserBorrowedError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const UserBorrowedError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, message, genericError];
}