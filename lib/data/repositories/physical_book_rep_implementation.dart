import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/util/response_verifier.dart';
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
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.getPhysicalBookById(
        id: id,
        authorization: authorization,
      );
      final ResponseVerifier<PhysicalBookModel> responseVerifier =
          ResponseVerifier<PhysicalBookModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    }
  }

  @override
  Future<DataState<PhysicalBookModel>> getPhysicalBookByBarcode(
      String barcode) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.getPhysicalBookByBarcode(
        barcode: barcode,
        authorization: authorization,
      );
      final ResponseVerifier<PhysicalBookModel> responseVerifier =
          ResponseVerifier<PhysicalBookModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    }
  }

  @override
  Future<DataState<List<PhysicalBookModel>>> getPhysicalBooks(
      [int? pageSize]) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.getPhysicalBooks(
          take: pageSize, authorization: authorization);
      final ResponseVerifier<List<PhysicalBookModel>> responseVerifier =
          ResponseVerifier<List<PhysicalBookModel>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      logger.d('DioE in rep: ${e.toString()}');
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(
              e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(e.response?.statusCode ?? 500, e, messages);
    } on Error catch (e) {
      logger.d('E in rep: ${e.stackTrace.toString()}');
      rethrow;
    }
  }
}
