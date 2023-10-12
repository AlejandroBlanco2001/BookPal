

import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class FineRepository {
  Future<DataState<Fine>> getFine(String id);
  Future<DataState<List<Fine>>> getFinesByUser(String userId);
}