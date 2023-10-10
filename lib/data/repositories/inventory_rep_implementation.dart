

import 'package:bookpal/data/models/inventory_model.dart';
import 'package:bookpal/domain/repositories/inventory_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class InventoryRepositoryImplementation implements InventoryRepository {
  @override
  Future<DataState<InventoryModel>> getInventoryForItem() {
    throw UnimplementedError();
  }
}