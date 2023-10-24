
import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/physical_book.dart';
import 'package:bookpal/domain/repositories/physical_book_repository.dart';

class GetPhysicalBookUsecase extends Usecase<DataState<PhysicalBook>> {

  final PhysicalBookRepository _physicalBookRepository;

  GetPhysicalBookUsecase(this._physicalBookRepository);

  @override
  Future<DataState<PhysicalBook>> call({Map<String, dynamic>? params}) {
    String? barcode = params!['email'];
    int? id = params['id'];
    if (barcode != null) {
      return _physicalBookRepository.getPhysicalBookByBarcode(barcode);
    }
    return _physicalBookRepository.getPhysicalBookById(id!);
  }
}
