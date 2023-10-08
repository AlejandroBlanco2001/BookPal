
import 'package:bookpal/data/models/book_model.dart';
import 'package:bookpal/domain/repositories/book_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class BookRepositoryImplementation implements BookRepository {
  @override
  Future<DataState<BookModel>> getBook(){
    throw UnimplementedError();
  }
}