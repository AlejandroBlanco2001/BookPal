

import 'package:json_annotation/json_annotation.dart';
import 'package:bookpal/core/util/utilities.dart';

abstract class Inventory {
  final int id;
  @JsonKey(name: 'physical_book_barcode')
  final String physicalBookBarcode;
  @JsonKey(name: 'creation_date', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
  final DateTime creationDate;
  @JsonKey(name: 'last_update', fromJson: Utilities.fromISO8601String, toJson: Utilities.toISO8601String)
  DateTime lastUpdate;
  int quantity;
  @JsonKey(name: 'minimun_quantity')
  int minimunQuantity;
  @JsonKey(name: 'maximum_quantity')
  int maximumQUantity;
  @JsonKey(name: 'reorder_quantity')
  int? reorderQuantity;

  Inventory({
    required this.id,
    required this.physicalBookBarcode,
    required this.creationDate,
    required this.quantity,
    this.minimunQuantity = 0,
    required this.maximumQUantity,
    this.reorderQuantity
  }) : lastUpdate = creationDate;

}