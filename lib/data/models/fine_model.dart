import 'package:bookpal/data/enums/fine_status.dart';
import 'package:bookpal/domain/entities/fine.dart';

class FineModel extends Fine {
  const FineModel({
    required String id,
    required String loanId,
    double amount = 0,
    FineStatus status = FineStatus.unpaid,
    required DateTime payDate,
  }) : super(
          id: id,
          loanId: loanId,
          amount: amount,
          payDate: payDate,
          status: status,
        );

  @override
  factory FineModel.fromJson(Map<String, dynamic> json) => FineModel(
        id: json['id'] ?? "",
        loanId: json['loan_id'] ?? "",
        amount: json['amount'] ?? 0.0,
        status: FineStatus.values[json['status'] ?? FineStatus.unpaid.index],
        payDate: DateTime.parse(json['pay_date'] ?? ""),
      );

}
