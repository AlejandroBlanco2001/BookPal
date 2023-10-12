

import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/resources/data_state.dart';

abstract class CompanyRepository {
  Future<DataState<Company>> getCompany(String id);
}