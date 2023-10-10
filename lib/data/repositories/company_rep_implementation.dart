

import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';
import 'package:bookpal/domain/resources/data_state.dart';

class CompanyRepositoryImplementation implements CompanyRepository {
  @override
  Future<DataState<Company>> getCompany() {
    throw UnimplementedError();
  }
}