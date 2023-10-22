import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/loan.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';

class GetLoanUsecase extends Usecase<DataState<Loan>> {

  final LoanRepository _loanRepository;

  GetLoanUsecase(this._loanRepository);

  @override
  Future<DataState<Loan>> call({Map<String, dynamic>? params}) {
    int id = params!['id'];
    return _loanRepository.getLoan(id);
  }
}