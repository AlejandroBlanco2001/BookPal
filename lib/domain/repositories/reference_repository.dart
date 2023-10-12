

import 'package:bookpal/domain/entities/reference.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class ReferenceRepository {
  Future<DataState<Reference>> getReference(String id);
}