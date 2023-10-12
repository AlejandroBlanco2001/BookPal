

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class CompanyRepositoryImplementation implements CompanyRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  CompanyRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<Company>> getCompany(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getCompany(
        id: id,
      );

      final ResponseVerifier<Company> responseVerifier = ResponseVerifier<Company>();

      return responseVerifier.validateResponse(httpResponse);
      
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}