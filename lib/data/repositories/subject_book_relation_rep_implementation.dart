

import 'package:bookpal/data/data_sources/remote/api_service.dart';
import 'package:bookpal/data/helpers/response_verifier.dart';
import 'package:bookpal/data/models/subject_book_relation_model.dart';
import 'package:bookpal/domain/repositories/subject_book_relation_repository.dart';
import 'package:bookpal/core/resources/data_state.dart';
import 'package:dio/dio.dart';

class SubjectBookRelationRepositoryImplementation implements SubjectBookRelationRepository {

  final ApiService _apiService;

  SubjectBookRelationRepositoryImplementation(this._apiService);
  
  @override
  Future<DataState<SubjectBookRelationModel>> getRelation(int id) async {
    try {
      final httpResponse = await _apiService.getRelation(
        id: id,
      );
      final ResponseVerifier<SubjectBookRelationModel> responseVerifier = ResponseVerifier<SubjectBookRelationModel>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
  
  @override
  Future<DataState<List<String>>> getRelatedSubjects(int bookId) async {
    try {
      final httpResponse = await _apiService.getRelatedSubjects(
        bookId: bookId,
      );
      final ResponseVerifier<List<String>> responseVerifier = ResponseVerifier<List<String>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }

  @override
  Future<DataState<List<String>>> getRelatedBooks(int subjectId) async {
    try {
      final httpResponse = await _apiService.getRelatedBooks(
        subjectId: subjectId,
      );
      final ResponseVerifier<List<String>> responseVerifier = ResponseVerifier<List<String>>();
      return responseVerifier.validateResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(500,e);
    }
  }
}