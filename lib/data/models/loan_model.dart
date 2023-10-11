

import 'package:bookpal/data/enums/loan_status.dart';
import 'package:bookpal/domain/entities/loan.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loan_model.g.dart';

@JsonSerializable()
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

  factory LoanModel.fromJson(Map<String, dynamic> json) => _$LoanModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanModelToJson(this);
  
}