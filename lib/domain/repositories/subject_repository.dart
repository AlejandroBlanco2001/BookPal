

import 'package:bookpal/domain/entities/subject.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class SubjectRepository {
  Future<DataState<Subject>> getSubject(String id);
}