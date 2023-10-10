

abstract class Inventory {
  final String id;
  final String physicalBookBarcode;
  final DateTime creationDate;
  DateTime lastUpdate;
  int quantity;
  int minimunQuantity;
  int maximumQUantity;
  int? reorderQuantity;

  Inventory({
    required this.id,
    required this.physicalBookBarcode,
    required this.creationDate,
    required this.quantity,
    required this.minimunQuantity,
    required this.maximumQUantity,
    this.reorderQuantity
  }) : lastUpdate = creationDate;

}