import 'package:bookpal/core/resources/data_state.dart';
import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/domain/entities/company.dart';
import 'package:bookpal/domain/repositories/company_repository.dart';

class InitCompanyUsecase extends Usecase<DataState<Company>> {

  final CompanyRepository _companyRepository;

  InitCompanyUsecase(this._companyRepository);

  @override
  Future<DataState<Company>> call({Map<String, dynamic>? params}) {
    return _companyRepository.getCompanyStyle(params!['id']);
  }
}