

import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class FineRepository {
  Future<DataState<Fine>> getFine(int id);
  Future<DataState<List<Fine>>> getFinesByUser(int userId);
}