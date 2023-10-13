

import 'package:bookpal/domain/entities/book.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class BookRepository {
  Future<DataState<Book>> getBook(String barcode);
  Future<DataState<List<Book>>> getBooks();
}