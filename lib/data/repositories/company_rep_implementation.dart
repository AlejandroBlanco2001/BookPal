

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
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
      final httpResponse = await _apiService.getCompany(
        id: id,
      );

      final ResponseVerifier<Company> responseVerifier = ResponseVerifier<Company>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<List<Company>>> getCompanies() async {
    try {
      final httpResponse = await _apiService.getCompanies();

      final ResponseVerifier<List<Company>> responseVerifier = ResponseVerifier<List<Company>>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<Company>> putCompany(int id, Company company) async {
    try {
      final httpResponse = await _apiService.putCompany(
        id: id,
        company: company as CompanyModel,
      );
      
      final ResponseVerifier<CompanyModel> responseVerifier = ResponseVerifier<CompanyModel>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
}