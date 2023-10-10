

import 'package:bookpal/domain/entities/fine.dart';
import 'package:bookpal/domain/repositories/fine_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class FineRepositoryImplementation implements FineRepository {
  @override
  Future<DataState<Fine>> getFine() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<Fine>>> getFinesByUser() {
    throw UnimplementedError();
  }
}