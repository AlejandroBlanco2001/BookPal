

import 'package:bookpal/data/enums/fine_status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

abstract class Fine {
  final int id;
  @JsonKey(name: 'loan_id')
  final int loanId;
  final double amount;
  FineStatus status;
  @JsonKey(name: 'pay_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
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