

import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/data/models/company_model.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';

class UpdateCompanyUsecase implements Usecase<DataState<Company>> {

  final CompanyRepository _companyRepository;

  UpdateCompanyUsecase(this._companyRepository);

  @override
  Future<DataState<Company>> call({Map<String, dynamic>? params}) {
    String id = params!['id'];
    CompanyModel company = params['company'];
    return _companyRepository.putCompany(id, company);
  }
}