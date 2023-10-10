

import 'package:bookpal/data/enums/fine_status.dart';
import 'package:equatable/equatable.dart';

abstract class Fine extends Equatable {
  final String id;
  final String loanId;
  final double amount;
  final FineStatus status;
  final DateTime payDate;
  
  const Fine({
    required this.id,
    required this.loanId,
    required this.amount,
    required this.status,
    required this.payDate
  });

  get hasBeenPaid => status == FineStatus.paid;

  @override
  List<Object?> get props => [
    id,
    loanId,
    amount,
    status,
    payDate
  ];
}