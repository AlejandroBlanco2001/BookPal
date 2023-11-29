

import 'package:bookpal/domain/entities/loan.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class LoanRepository {
  Future<DataState<Loan>> getLoan(int id);
  Future<DataState<Loan>> postLoan(String bookBarcode);
  Future<DataState<List<Loan>>> getLoansByUser(int userId);
  Future<DataState<Loan>> makeReturn(int id, Map<String,String> fields);
}