import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/loan.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';

class GetLoansByUserUsecase extends Usecase<DataState<List<Loan>>> {
  final LoanRepository _loanRepository;

  GetLoansByUserUsecase(this._loanRepository);

  @override
  Future<DataState<List<Loan>>> call({Map<String, dynamic>? params}) {
    int userId = params!['userId'];
    return _loanRepository.getLoansByUser(userId);
  }
}