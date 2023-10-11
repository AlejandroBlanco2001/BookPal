// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanModel _$LoanModelFromJson(Map<String, dynamic> json) => LoanModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      physicalBookBarcode: json['physicalBookBarcode'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      dueDate: DateTime.parse(json['dueDate'] as String),
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      status: $enumDecodeNullable(_$LoanStatusEnumMap, json['status']) ??
          LoanStatus.active,
    );

Map<String, dynamic> _$LoanModelToJson(LoanModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'physicalBookBarcode': instance.physicalBookBarcode,
      'startDate': instance.startDate.toIso8601String(),
      'dueDate': instance.dueDate.toIso8601String(),
      'returnDate': instance.returnDate?.toIso8601String(),
      'status': _$LoanStatusEnumMap[instance.status]!,
    };

const _$LoanStatusEnumMap = {
  LoanStatus.active: 'active',
  LoanStatus.returned: 'returned',
  LoanStatus.overdue: 'overdue',
};
