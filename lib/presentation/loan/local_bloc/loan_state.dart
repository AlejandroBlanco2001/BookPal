part of 'loan_bloc.dart';

sealed class LoanState extends Equatable {
  const LoanState();
  
  @override
  List<Object> get props => [];
}

final class LoanInitial extends LoanState {}
