

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/inventory_model.dart';
import 'package:bookpal/domain/repositories/inventory_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class InventoryRepositoryImplementation implements InventoryRepository {

  final ApiService _apiService;

  InventoryRepositoryImplementation(this._apiService);

  @override
  Future<DataState<InventoryModel>> getInventory(String id) async {
    try {
      final httpResponse = await _apiService.getInventory(
        id: id,
      );
      final ResponseVerifier<InventoryModel> responseVerifier = ResponseVerifier<InventoryModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<InventoryModel>> getInventoryForItem(String itemId) async {
    try {
      final httpResponse = await _apiService.getInventoryForItem(
        itemId: itemId,
      );
      final ResponseVerifier<InventoryModel> responseVerifier = ResponseVerifier<InventoryModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
}