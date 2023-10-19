

import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';

class GetCompanyUsecase implements Usecase<DataState<Company>> {

  final CompanyRepository _companyRepository;

  GetCompanyUsecase(this._companyRepository);

  @override
  Future<DataState<Company>> call({Map<String, dynamic>? params}) {
    int id = params!['id'];
    return _companyRepository.getCompany(id);
  }
}