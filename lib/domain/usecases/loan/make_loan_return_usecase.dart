import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/loan.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';

class MakeLoanReturnUsecase implements Usecase<DataState<Loan>> {
  final LoanRepository repository;

  MakeLoanReturnUsecase(this.repository);

  @override
  Future<DataState<Loan>> call({Map<String,dynamic>? params}) async {
    int id = params!['id'];
    return await repository.makeReturn(id);
  }
}