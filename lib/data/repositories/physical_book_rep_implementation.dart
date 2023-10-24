

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class PhysicalBookRepositoryImplementation implements PhysicalBookRepository {

  final ApiService _apiService;

  PhysicalBookRepositoryImplementation(this._apiService);

  @override
  Future<DataState<PhysicalBookModel>> getPhysicalBookById(int id) async {
    try {
      final httpResponse = await _apiService.getPhysicalBookById(
        id: id,
      );
      final ResponseVerifier<PhysicalBookModel> responseVerifier = ResponseVerifier<PhysicalBookModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<PhysicalBookModel>> getPhysicalBookByBarcode(String barcode) async {
    try {
      final httpResponse = await _apiService.getPhysicalBookByBarcode(
        barcode: barcode,
      );
      final ResponseVerifier<PhysicalBookModel> responseVerifier = ResponseVerifier<PhysicalBookModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<List<PhysicalBookModel>>> getPhysicalBooks() async {
    try {
      final httpResponse = await _apiService.getPhysicalBooks();
      final ResponseVerifier<List<PhysicalBookModel>> responseVerifier = ResponseVerifier<List<PhysicalBookModel>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
}