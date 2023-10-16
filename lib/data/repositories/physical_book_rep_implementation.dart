

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
  Future<DataState<PhysicalBookModel>> getPhysicalBook(String id) async {
    try {
      final httpResponse = await _apiService.getPhysicalBook(
        id: id,
      );
      final ResponseVerifier<PhysicalBookModel> responseVerifier = ResponseVerifier<PhysicalBookModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}