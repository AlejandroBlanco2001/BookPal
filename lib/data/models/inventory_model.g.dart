// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) =>
    InventoryModel(
      id: json['id'] as String,
      physicalBookBarcode: json['physicalBookBarcode'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      quantity: json['quantity'] as int,
      minimunQuantity: json['minimunQuantity'] as int? ?? 0,
      maximumQUantity: json['maximumQUantity'] as int,
      reorderQuantity: json['reorderQuantity'] as int?,
    );

Map<String, dynamic> _$InventoryModelToJson(InventoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'physicalBookBarcode': instance.physicalBookBarcode,
      'creationDate': instance.creationDate.toIso8601String(),
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'quantity': instance.quantity,
      'minimunQuantity': instance.minimunQuantity,
      'maximumQUantity': instance.maximumQUantity,
      'reorderQuantity': instance.reorderQuantity,
    };
