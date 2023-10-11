

import 'package:bookpal/data/models/subject_book_relation_model.dart';
import 'package:bookpal/domain/repositories/subject_book_relation_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class SubjectBookRelationRepositoryImplementation implements SubjectBookRelationRepository {
  
  @override
  Future<DataState<SubjectBookRelationModel>> getRelation() {
    throw UnimplementedError();
  }
  
  @override
  Future<DataState<List<String>>> getRelatedSubjects() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<String>>> getRelatedBooks() {
    throw UnimplementedError();
  }
}