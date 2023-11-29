part of 'home_books_bloc.dart';

sealed class HomeBooksEvent extends Equatable {
  const HomeBooksEvent();

  @override
  List<Object> get props => [];
}

final class FetchHomeBooks extends HomeBooksEvent {}

final class RefreshHomeBooks extends HomeBooksEvent {}

final class RefreshHomeBook extends HomeBooksEvent {
  final String bookBarcode;

  const RefreshHomeBook(this.bookBarcode);

  @override
  List<Object> get props => [bookBarcode];
}