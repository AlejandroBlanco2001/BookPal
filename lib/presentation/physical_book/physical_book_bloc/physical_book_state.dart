part of 'physical_book_bloc.dart';

sealed class PhysicalBookState extends Equatable {
  const PhysicalBookState();
  
  @override
  List<Object> get props => [];
}

final class PhysicalBookInitial extends PhysicalBookState {}
