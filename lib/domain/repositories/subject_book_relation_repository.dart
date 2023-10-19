

import 'package:bookpal/domain/entities/subject_book_relation.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class SubjectBookRelationRepository {
  Future<DataState<SubjectBookRelation>> getRelation(int id);
  Future<DataState<List<String>>> getRelatedSubjects(int bookId);
  Future<DataState<List<String>>> getRelatedBooks(int subjectId);
}