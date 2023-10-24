

import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class CompanyRepository {
  Future<DataState<Company>> getCompany(int id);
  Future<DataState<List<Company>>> getCompanies();
  Future<DataState<Company>> putCompany(int id, Company company);
}