

import 'package:bookpal/data/data_sources/remote/general_database_api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/subject_book_relation_model.dart';
import 'package:bookpal/domain/repositories/subject_book_relation_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class SubjectBookRelationRepositoryImplementation implements SubjectBookRelationRepository {

  final GeneralDatabaseApiService _generalDatabaseApiService;

  SubjectBookRelationRepositoryImplementation(this._generalDatabaseApiService);
  
  @override
  Future<DataState<SubjectBookRelationModel>> getRelation(String id) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getRelation(
        id: id,
      );
      final ResponseVerifier<SubjectBookRelationModel> responseVerifier = ResponseVerifier<SubjectBookRelationModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<List<String>>> getRelatedSubjects(String bookId) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getRelatedSubjects(
        bookId: bookId,
      );
      final ResponseVerifier<List<String>> responseVerifier = ResponseVerifier<List<String>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<String>>> getRelatedBooks(String subjectId) async {
    try {
      final httpResponse = await _generalDatabaseApiService.getRelatedBooks(
        subjectId: subjectId,
      );
      final ResponseVerifier<List<String>> responseVerifier = ResponseVerifier<List<String>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}