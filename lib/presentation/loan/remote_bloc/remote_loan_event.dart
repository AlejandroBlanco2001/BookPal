part of 'remote_loan_bloc.dart';

sealed class RemoteLoanEvent extends Equatable {
  const RemoteLoanEvent();

  @override
  List<Object> get props => [];
}

final class GetLoan extends RemoteLoanEvent {
  final int id;

  const GetLoan(this.id);

  @override
  List<Object> get props => [id];
}

final class GetLoansByUser extends RemoteLoanEvent {
  final int userId;

  const GetLoansByUser(this.userId);

  @override
  List<Object> get props => [userId];
}

final class CreateLoan extends RemoteLoanEvent {
  final int userId;
  final int bookId;

  const CreateLoan(this.userId, this.bookId);

  @override
  List<Object> get props => [userId, bookId];
}

final class MakeLoanReturn extends RemoteLoanEvent {
  final int id;

  const MakeLoanReturn(this.id);

  @override
  List<Object> get props => [id];
}
