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

final class CreateLoan extends RemoteLoanEvent {
  final String bookBarcode;

  const CreateLoan(this.bookBarcode);

  @override
  List<Object> get props => [bookBarcode];
}

final class MakeLoanReturn extends RemoteLoanEvent {
  final int id;
  final String dynamicCode;

  const MakeLoanReturn(this.id, this.dynamicCode);

  @override
  List<Object> get props => [id, dynamicCode];
}
