import 'package:bookpal/data/enums/fine_status.dart';
import 'package:bookpal/domain/entities/fine.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fine_model.g.dart';

@JsonSerializable()
class FineModel extends Fine {
  FineModel({
    required int id,
    required int loanId,
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

  factory FineModel.fromJson(Map<String, dynamic> json) => _$FineModelFromJson(json);

  Map<String, dynamic> toJson() => _$FineModelToJson(this);

}
