part of 'remote_borrowed_bloc.dart';

sealed class RemoteBorrowedState extends Equatable {


  const RemoteBorrowedState();
  
  @override
  List<Object> get props => [];
}

final class RemoteBorrowedInitial extends RemoteBorrowedState {}
