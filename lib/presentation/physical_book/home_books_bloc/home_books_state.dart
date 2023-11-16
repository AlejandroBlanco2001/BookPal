part of 'home_books_bloc.dart';

sealed class HomeBooksState extends Equatable {

  final List<PhysicalBookModel> allBooks;
  final DioException? dioError;
  final int? statusCode;
  final List<String>? message;
  final dynamic genericError;

  const HomeBooksState({this.allBooks = const [], this.statusCode, this.dioError, this.message, this.genericError});
  
  @override
  List<Object?> get props => [allBooks, statusCode, dioError, message, genericError];
}

final class HomeBooksInitial extends HomeBooksState {}

final class HomeBooksLoading extends HomeBooksState {}

final class HomeBooksLoaded extends HomeBooksState {

  const HomeBooksLoaded(int statusCode, List<PhysicalBookModel> allBooks) : super(statusCode: statusCode, allBooks: allBooks);

  @override
  List<Object?> get props => [statusCode, allBooks];
}

final class HomeBooksError extends HomeBooksState {

  const HomeBooksError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const HomeBooksError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [dioError, genericError, statusCode, message];
}
