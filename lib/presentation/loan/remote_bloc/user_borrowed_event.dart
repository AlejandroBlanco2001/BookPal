part of 'user_borrowed_bloc.dart';

sealed class UserBorrowedEvent extends Equatable {
  const UserBorrowedEvent();

  @override
  List<Object> get props => [];
}

final class GetUserBorrowed extends UserBorrowedEvent {

  const GetUserBorrowed();

  @override
  List<Object> get props => [];
}

final class DisposeBorrowed extends UserBorrowedEvent {
  const DisposeBorrowed();

  @override
  List<Object> get props => [];
}