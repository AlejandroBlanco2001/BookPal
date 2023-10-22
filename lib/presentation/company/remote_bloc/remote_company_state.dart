part of 'remote_company_bloc.dart';

sealed class RemoteCompanyState extends Equatable {

  final CompanyModel? company;
  final List<CompanyModel>? companies;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;

  const RemoteCompanyState({this.company, this.companies, this.dioError, this.genericError, this.statusCode = 200});

  @override
  List<Object?> get props => [company, companies, dioError, genericError, statusCode];
}

final class RemoteCompanyInitial extends RemoteCompanyState {}

final class RemoteCompanyLoading extends RemoteCompanyState {}

final class RemoteCompanyLoaded extends RemoteCompanyState {
  const RemoteCompanyLoaded(int statusCode, CompanyModel company) : super(statusCode: statusCode, company: company);

  @override
  List<Object?> get props => [statusCode, company];
}

final class RemoteCompanyUpdated extends RemoteCompanyState {
  const RemoteCompanyUpdated(int statusCode, CompanyModel company) : super(statusCode: statusCode, company: company);

  @override
  List<Object?> get props => [statusCode, company];
}

final class RemoteCompaniesLoaded extends RemoteCompanyState {

  const RemoteCompaniesLoaded(int statusCode, List<CompanyModel> companies) : super(statusCode: statusCode, companies: companies);

  @override
  List<Object?> get props => [statusCode, companies];
}

final class RemoteCompanyError extends RemoteCompanyState {
  const RemoteCompanyError(DioException dioError, [int? statusCode]) : super(statusCode: statusCode, dioError: dioError);
  const RemoteCompanyError.genericError(dynamic genericError) : super(genericError: genericError);
  
  @override
  List<Object?> get props => [statusCode, dioError];
}
