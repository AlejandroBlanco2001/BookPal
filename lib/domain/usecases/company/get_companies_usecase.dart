import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';

class GetCompaniesUsecase extends Usecase<DataState<List<Company>>> {

  final CompanyRepository _companyRepository;

  GetCompaniesUsecase(this._companyRepository);

  @override
  Future<DataState<List<Company>>> call({void params}) {
    return _companyRepository.getCompanies();
  }
}