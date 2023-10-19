

import 'package:bookpal/domain/entities/subject.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class SubjectRepository {
  Future<DataState<Subject>> getSubject(int id);
}