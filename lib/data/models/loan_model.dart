

import 'package:bookpal/data/enums/loan_status.dart';
import 'package:bookpal/domain/entities/loan.dart';

class LoanModel extends Loan {
  LoanModel({
    required String id,
    required String userId,
    required String physicalBookBarcode,
    required DateTime startDate,
    required DateTime dueDate,
    DateTime? returnDate,
    LoanStatus status = LoanStatus.active,
  }) : super(
          id: id,
          userId: userId,
          physicalBookBarcode: physicalBookBarcode,
          startDate: startDate,
          dueDate: dueDate,
          returnDate: returnDate,
          status: status
        );

  factory LoanModel.fromJson(Map<String, dynamic> json) => LoanModel(
        id: json['id'] ?? "",
        userId: json['userId'] ?? "",
        physicalBookBarcode: json['physicalBookBarcode'] ?? "",
        startDate: DateTime.parse(json['startDate'] ?? ""),
        dueDate: DateTime.parse(json['dueDate'] ?? ""),
        returnDate: DateTime.parse(json['returnDate'] ?? ""),
        status: LoanStatus.values[json['status'] ?? LoanStatus.active.index]
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'physicalBookBarcode': physicalBookBarcode,
    'startDate': startDate.toIso8601String(),
    'dueDate': dueDate.toIso8601String(),
    'returnDate': returnDate?.toIso8601String(),
    'status': status.name
  };
}