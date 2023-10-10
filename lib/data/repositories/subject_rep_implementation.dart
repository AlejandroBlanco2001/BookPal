

import 'package:bookpal/domain/entities/subject.dart';
import 'package:bookpal/domain/repositories/subject_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class SubjectRepositoryImplementation implements SubjectRepository {
  @override
  Future<DataState<Subject>> getSubject() {
    throw UnimplementedError();
  }
}