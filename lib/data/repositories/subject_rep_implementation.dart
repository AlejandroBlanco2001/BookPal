

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/subject_model.dart';
import 'package:bookpal/domain/entities/subject.dart';
import 'package:bookpal/domain/repositories/subject_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';
import 'package:dio/dio.dart';

class SubjectRepositoryImplementation implements SubjectRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  SubjectRepositoryImplementation(this._generalDatabaseApiService);

  @override
  Future<DataState<Subject>> getSubject(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getSubject(
        id: id,
      );
      final ResponseVerifier<SubjectModel> responseVerifier = ResponseVerifier<SubjectModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}