

import 'package:bookpal/domain/entities/book.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class BookRepository {
  Future<DataState<Book>> getBook(String id);
}