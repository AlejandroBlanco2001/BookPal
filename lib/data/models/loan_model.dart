

import 'package:bookpal/data/enums/loan_status.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/entities/loan.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

part 'loan_model.g.dart';

@JsonSerializable()
class LoanModel extends Loan {
  const LoanModel({
    required int id,
    required int userId,
    String? physicalBookBarcode,
    PhysicalBookModel? physicalBook,
    required DateTime startDate,
    required DateTime dueDate,
    DateTime? returnDate,
    LoanStatus status = LoanStatus.active,
  }) : super(
          id: id,
          userId: userId,
          physicalBookBarcode: physicalBookBarcode,
          physicalBook: physicalBook,
          startDate: startDate,
          dueDate: dueDate,
          returnDate: returnDate,
          status: status
        );

  factory LoanModel.fromJson(Map<String, dynamic> json) => _$LoanModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanModelToJson(this);
  
}