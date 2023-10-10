

import 'package:bookpal/domain/repositories/subject_book_relation_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class SubjectBookRelationRepositoryImplementation implements SubjectBookRelationRepository {
  @override
  Future<DataState<String>> getRelatedSubject() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<String>> getRelatedBook() {
    throw UnimplementedError();
  }
}