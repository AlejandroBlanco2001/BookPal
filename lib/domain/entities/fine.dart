

import 'package:bookpal/data/enums/fine_status.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Fine {
  final int id;
  @JsonKey(name: 'loan_id')
  final int loanId;
  final double amount;
  FineStatus status;
  @JsonKey(name: 'pay_date')
  final DateTime payDate;
  
  Fine({
    required this.id,
    required this.loanId,
    this.amount = 0,
    this.status = FineStatus.unpaid,
    required this.payDate
  });

  get hasBeenPaid => status == FineStatus.paid;
}