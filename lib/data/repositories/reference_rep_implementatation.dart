

import 'package:bookpal/domain/entities/reference.dart';
import 'package:bookpal/domain/repositories/reference_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class ReferenceRepositoryImplementation implements ReferenceRepository {
  @override
  Future<DataState<Reference>> getReference() {
    throw UnimplementedError();
  }
}