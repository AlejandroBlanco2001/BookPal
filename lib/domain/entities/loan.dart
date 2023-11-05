

import 'package:bookpal/data/enums/loan_status.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

abstract class Loan {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'physical_book_barcode')
  final String physicalBookBarcode;
  @JsonKey(name: 'start_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
  final DateTime startDate;
  @JsonKey(name: 'due_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
  final DateTime dueDate;
  @JsonKey(name: 'return_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
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