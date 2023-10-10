

import 'package:bookpal/data/enums/loan_status.dart';

abstract class Loan {
  final String id;
  final String userId;
  final String physicalBookBarcode;
  final DateTime startDate;
  final DateTime dueDate;
  DateTime? returnDate;
  LoanStatus status;

  Loan({
    required this.id,
    required this.userId,
    required this.physicalBookBarcode,
    required this.startDate,
    required this.dueDate,
    this.returnDate,
    this.status = LoanStatus.active,
  });
}