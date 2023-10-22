part of 'company_bloc.dart';

sealed class CompanyState extends Equatable {
  const CompanyState();
  
  @override
  List<Object> get props => [];
}

final class CompanyInitial extends CompanyState {}
