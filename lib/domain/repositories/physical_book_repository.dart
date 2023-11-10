

import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class PhysicalBookRepository {
  Future<DataState<PhysicalBook>> getPhysicalBookById(int id);
  Future<DataState<PhysicalBook>> getPhysicalBookByBarcode(String barcode);
  Future<DataState<List<PhysicalBook>>> getPhysicalBooks([int pageSize]);
}