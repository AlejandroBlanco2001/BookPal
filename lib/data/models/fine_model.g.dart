// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FineModel _$FineModelFromJson(Map<String, dynamic> json) => FineModel(
      id: json['id'] as String,
      loanId: json['loanId'] as String,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      status: $enumDecodeNullable(_$FineStatusEnumMap, json['status']) ??
          FineStatus.unpaid,
      payDate: DateTime.parse(json['payDate'] as String),
    );

Map<String, dynamic> _$FineModelToJson(FineModel instance) => <String, dynamic>{
      'id': instance.id,
      'loanId': instance.loanId,
      'amount': instance.amount,
      'status': _$FineStatusEnumMap[instance.status]!,
      'payDate': instance.payDate.toIso8601String(),
    };

const _$FineStatusEnumMap = {
  FineStatus.paid: 'paid',
  FineStatus.unpaid: 'unpaid',
};
