part of 'remote_company_bloc.dart';

sealed class RemoteCompanyEvent extends Equatable {
  const RemoteCompanyEvent();

  @override
  List<Object> get props => [];
}

final class InitCompany extends RemoteCompanyEvent {}

final class GetCompany extends RemoteCompanyEvent {
  final int id;

  const GetCompany(this.id);

  @override
  List<Object> get props => [id];
}

final class GetCompanies extends RemoteCompanyEvent {}

final class UpdateCompany extends RemoteCompanyEvent {
  final int id;
  final Map<String, dynamic> fields;

  const UpdateCompany(this.id, this.fields);

  @override
  List<Object> get props => [id, fields];
}
