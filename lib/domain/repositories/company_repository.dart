

import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/core/resources/data_state.dart';

abstract class CompanyRepository {
  Future<DataState<Company>> getCompany(String id);
  Future<DataState<Company>> putCompany(String id, Company company);
}