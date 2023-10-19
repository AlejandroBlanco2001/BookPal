

import 'package:bookpal/domain/entities/inventory.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class InventoryRepository {
  Future<DataState<Inventory>> getInventory(int id);
  Future<DataState<Inventory>> getInventoryForItem(String itemId);
}