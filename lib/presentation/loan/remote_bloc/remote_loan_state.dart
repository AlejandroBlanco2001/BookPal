part of 'remote_loan_bloc.dart';

sealed class RemoteLoanState extends Equatable {
  final LoanModel? loan;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const RemoteLoanState(
      {this.loan,
      this.dioError,
      this.genericError,
      this.statusCode,
      this.message});

  @override
  List<Object?> get props => [loan, dioError, genericError, statusCode];
}

final class RemoteLoanInitial extends RemoteLoanState {}

final class RemoteLoanLoading extends RemoteLoanState {}

final class RemoteLoanLoaded extends RemoteLoanState {
  const RemoteLoanLoaded(int statusCode, LoanModel loan)
      : super(statusCode: statusCode, loan: loan);

  @override
  List<Object?> get props => [statusCode, loan];
}

final class RemoteLoanReturned extends RemoteLoanState {
  const RemoteLoanReturned(int statusCode, LoanModel loan)
      : super(statusCode: statusCode, loan: loan);

  @override
  List<Object?> get props => [statusCode, loan];
}

final class RemoteLoanCreated extends RemoteLoanState {
  const RemoteLoanCreated(int statusCode, LoanModel loan)
      : super(statusCode: statusCode, loan: loan);

  @override
  List<Object?> get props => [statusCode, loan];
}

final class CreateLoanError extends RemoteLoanState {
  const CreateLoanError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const CreateLoanError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, genericError];
}

final class ReturnLoanError extends RemoteLoanState {
  const ReturnLoanError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const ReturnLoanError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, genericError];
}

final class RemoteLoanError extends RemoteLoanState {
  const RemoteLoanError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const RemoteLoanError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, dioError, genericError];
}