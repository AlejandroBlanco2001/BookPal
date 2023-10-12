

import 'package:bookpal/domain/entities/reference.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class ReferenceRepository {
  Future<DataState<Reference>> getReference(String id);
}