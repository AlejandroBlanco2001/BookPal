

import 'package:bookpal/domain/entities/subject_book_relation.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class SubjectBookRelationRepository {
  Future<DataState<SubjectBookRelation>> getRelation(String id);
  Future<DataState<List<String>>> getRelatedSubjects(String bookId);
  Future<DataState<List<String>>> getRelatedBooks(String subjectId);
}