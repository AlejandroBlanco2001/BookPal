

import 'package:bookpal/domain/entities/inventory.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class InventoryRepository {
  Future<DataState<Inventory>> getInventory();
  Future<DataState<Inventory>> getInventoryForItem();
}