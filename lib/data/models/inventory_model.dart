

import 'package:bookpal/domain/entities/inventory.dart';

class InventoryModel extends Inventory {
  InventoryModel({
    required String id,
    required String physicalBookBarcode,
    required DateTime creationDate,
    required DateTime lastUpdate,
    required int quantity,
    required int minimunQuantity,
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

  @override
  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
    id: json['id'] ?? "",
    physicalBookBarcode: json['physicalBookBarcode'] ?? "",
    creationDate: json['creationDate'] ?? "",
    lastUpdate: json['lastUpdate'] ?? "",
    quantity: json['quantity'] ?? "",
    minimunQuantity: json['minimunQuantity'] ?? "",
    maximumQUantity: json['maximumQUantity'] ?? "",
    reorderQuantity: json['reorderQuantity'] ?? ""
  );
}