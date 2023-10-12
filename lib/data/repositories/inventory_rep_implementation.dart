

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/inventory_model.dart';
import 'package:bookpal/domain/repositories/inventory_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class InventoryRepositoryImplementation implements InventoryRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  InventoryRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<InventoryModel>> getInventory(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getInventory(
        id: id,
      );
      final ResponseVerifier<InventoryModel> responseVerifier = ResponseVerifier<InventoryModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<InventoryModel>> getInventoryForItem(String itemId) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getInventoryForItem(
        itemId: itemId,
      );
      final ResponseVerifier<InventoryModel> responseVerifier = ResponseVerifier<InventoryModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}