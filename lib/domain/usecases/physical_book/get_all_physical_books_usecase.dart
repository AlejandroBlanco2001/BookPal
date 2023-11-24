import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';

class GetAllPhysicalBooksUsecase
    extends Usecase<DataState<List<PhysicalBook>>> {
  final PhysicalBookRepository _physicalBookRepository;

  GetAllPhysicalBooksUsecase(this._physicalBookRepository);

  @override
  Future<DataState<List<PhysicalBook>>> call({Map<String, dynamic>? params}) {
    bool topRated = params!['top_rated'] ?? false;
    return (topRated)
        ? _physicalBookRepository.getPopular()
        : _physicalBookRepository.getPhysicalBooks(pageSize: params['pageSize'], title: params['title']);
  }
}
