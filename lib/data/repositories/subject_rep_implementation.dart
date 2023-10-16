

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/subject_model.dart';
import 'package:bookpal/domain/entities/subject.dart';
import 'package:bookpal/domain/repositories/subject_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class SubjectRepositoryImplementation implements SubjectRepository {

  final ApiService _apiService;

  SubjectRepositoryImplementation(this._apiService);

  @override
  Future<DataState<Subject>> getSubject(String id) async {
    try {
      final httpResponse = await _apiService.getSubject(
        id: id,
      );
      final ResponseVerifier<SubjectModel> responseVerifier = ResponseVerifier<SubjectModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
}