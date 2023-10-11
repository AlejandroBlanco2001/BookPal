

import 'package:bookpal/domain/entities/inventory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory_model.g.dart';

@JsonSerializable()
class InventoryModel extends Inventory {
  InventoryModel({
    required String id,
    required String physicalBookBarcode,
    required DateTime creationDate,
    required DateTime lastUpdate,
    required int quantity,
    int minimunQuantity = 0,
    required int maximumQUantity,
    int? reorderQuantity
  }) : super(
    id: id,
    physicalBookBarcode: physicalBookBarcode,
    creationDate: creationDate,
    quantity: quantity,
    minimunQuantity: minimunQuantity,
    maximumQUantity: maximumQUantity,
    reorderQuantity: reorderQuantity
  );

  factory InventoryModel.fromJson(Map<String, dynamic> json) => _$InventoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryModelToJson(this);
  
}