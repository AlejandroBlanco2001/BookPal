

import 'package:bookpal/data/enums/loan_status.dart';
import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

abstract class Loan extends Equatable {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'physical_book_barcode')
  final String? physicalBookBarcode;
  @JsonKey(name: 'physical_book', fromJson: Utilities.physicalBookFromJsonNullable, toJson: Utilities.physicalBookToJsonNullable)
  final PhysicalBook? physicalBook;
  @JsonKey(name: 'start_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
  final DateTime startDate;
  @JsonKey(name: 'due_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
  final DateTime dueDate;
  @JsonKey(name: 'return_date', fromJson: Utilities.fromISO8601StringNullable, toJson: Utilities.toISO8601String)
  final DateTime? returnDate;
  final LoanStatus status;

  const Loan({
    required this.id,
    required this.userId,
    this.physicalBookBarcode,
    this.physicalBook,
    required this.startDate,
    required this.dueDate,
    this.returnDate,
    this.status = LoanStatus.active,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        physicalBookBarcode,
        physicalBook,
        startDate,
        dueDate,
        returnDate,
        status,
      ];
}