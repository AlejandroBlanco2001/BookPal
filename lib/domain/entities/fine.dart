

import 'package:bookpal/data/enums/fine_status.dart';

abstract class Fine {
  final String id;
  final String loanId;
  final double amount;
  FineStatus status;
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