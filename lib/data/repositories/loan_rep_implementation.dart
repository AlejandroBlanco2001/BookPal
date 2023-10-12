

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class LoanRepositoryImplementation implements LoanRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  LoanRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<LoanModel>> getLoan(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getLoan(
        id: id,
      );
      final ResponseVerifier<LoanModel> responseVerifier = ResponseVerifier<LoanModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<LoanModel>>> getLoansByUser(String userId) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getLoansByUser(
        userId: userId,
      );
      final ResponseVerifier<List<LoanModel>> responseVerifier = ResponseVerifier<List<LoanModel>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}