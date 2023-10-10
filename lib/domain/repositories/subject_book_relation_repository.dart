

import 'package:bookpal/domain/resources/data_state.dart';

abstract class SubjectBookRelationRepository {
  Future<DataState<String>> getRelatedSubject();
  Future<DataState<String>> getRelatedBook();
}