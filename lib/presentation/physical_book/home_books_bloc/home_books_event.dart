part of 'home_books_bloc.dart';

sealed class HomeBooksEvent extends Equatable {
  const HomeBooksEvent();

  @override
  List<Object> get props => [];
}

final class FetchHomeBooks extends HomeBooksEvent {}
