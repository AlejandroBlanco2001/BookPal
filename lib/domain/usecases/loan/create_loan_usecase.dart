import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/loan.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';

class CreateLoanUsecase extends Usecase<DataState<Loan>> {
  final LoanRepository _loanRepository;

  CreateLoanUsecase(this._loanRepository);

  @override
  Future<DataState<Loan>> call({Map<String, dynamic>? params}) {
    String bookBarcode = params!['physical_book_barcode'];
    return _loanRepository.postLoan(bookBarcode);
  }
}