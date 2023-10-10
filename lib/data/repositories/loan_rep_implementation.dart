

import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/domain/repositories/loan_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class LoanRepositoryImplementation implements LoanRepository {
  @override
  Future<DataState<LoanModel>> getLoan() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<LoanModel>>> getLoansByUser() {
    throw UnimplementedError();
  }
}