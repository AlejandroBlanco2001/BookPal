

import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class FineRepository {
  Future<DataState<Fine>> getFine();
  Future<DataState<List<Fine>>> getFinesByUser();
}