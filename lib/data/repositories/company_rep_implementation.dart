

import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/util/response_verifier.dart';
import 'package:bookpal/data/models/company_model.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class CompanyRepositoryImplementation implements CompanyRepository {

  final ApiService _apiService;

  CompanyRepositoryImplementation(this._apiService);

  @override
  Future<DataState<Company>> getCompany(int id) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.getCompany(
        id: id,
        authorization: authorization,
      );

      final ResponseVerifier<Company> responseVerifier = ResponseVerifier<Company>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e.response?.statusCode ?? 500, e, e.response?.data['message'] ?? "No message");
    }
  }

  @override
  Future<DataState<List<Company>>> getCompanies() async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.getCompanies(authorization: authorization);

      final ResponseVerifier<List<Company>> responseVerifier = ResponseVerifier<List<Company>>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e.response?.statusCode ?? 500, e, e.response?.data['message'] ?? "No message");
    }
  }

  @override
  Future<DataState<Company>> putCompany(int id, Map<String, dynamic> fields) async {
    try {
      String authorization = await Utilities.getAuthorization();
      final httpResponse = await _apiService.putCompany(
        id: id,
        fields: fields,
        authorization: authorization,
      );
      
      final ResponseVerifier<CompanyModel> responseVerifier = ResponseVerifier<CompanyModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      List<String>? messages = (e.response?.data['message'] is List)
          ? List<String>.from(e.response?.data['message'].map((m) => m.toString()))
          : [e.response?.data['message']];
      return DataFailed(
          e.response?.statusCode ?? 500, e, messages);
    }
  }
}