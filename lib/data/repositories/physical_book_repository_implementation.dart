

import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class PhysicalBookRepositoryImplementation implements PhysicalBookRepository {
  @override
  Future<DataState<PhysicalBookModel>> getPhysicalBook() {
    throw UnimplementedError();
  }
}