

import 'package:bookpal/domain/entities/loan.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class LoanRepository {
  Future<DataState<Loan>> getLoan(String id);
  Future<DataState<List<Loan>>> getLoansByUser(String userId);
}