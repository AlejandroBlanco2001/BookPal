

import 'package:bookpal/domain/entities/subject_book_relation.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class SubjectBookRelationRepository {
  Future<DataState<SubjectBookRelation>> getRelation();
  Future<DataState<List<String>>> getRelatedSubjects();
  Future<DataState<List<String>>> getRelatedBooks();
}