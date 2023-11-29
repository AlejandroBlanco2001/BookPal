part of 'home_books_bloc.dart';

sealed class HomeBooksState extends Equatable {

  final List<PhysicalBookModel> allBooks;
  final DioException? dioException;
  final int? statusCode;
  final List<String>? message;
  final dynamic genericError;

  const HomeBooksState({this.allBooks = const [], this.statusCode, this.dioException, this.message, this.genericError});
  
  @override
  List<Object?> get props => [allBooks, statusCode, dioException, message, genericError];
}

final class HomeBooksInitial extends HomeBooksState {}

final class HomeBooksLoading extends HomeBooksState {}

final class HomeBooksLoaded extends HomeBooksState {

  const HomeBooksLoaded(int statusCode, List<PhysicalBookModel> allBooks) : super(statusCode: statusCode, allBooks: allBooks);

  @override
  List<Object?> get props => [statusCode, allBooks];
}

final class HomeBooksUpdated extends HomeBooksState {

  const HomeBooksUpdated(List<PhysicalBookModel> allBooks, [int? statusCode]) : super(statusCode: statusCode, allBooks: allBooks);

  @override
  List<Object?> get props => [statusCode, allBooks];
}

final class HomeBooksRefreshed extends HomeBooksState {

  const HomeBooksRefreshed(List<PhysicalBookModel> allBooks, [int? statusCode]) : super(statusCode: statusCode, allBooks: allBooks);

  @override
  List<Object?> get props => [statusCode, allBooks];
}

final class RefreshHomeBookError extends HomeBooksState {
  const RefreshHomeBookError(DioException dioException, List<PhysicalBookModel> rollbackBooks,
      [int? statusCode, List<String>? message])
      : super(
            statusCode: statusCode,
            allBooks: rollbackBooks,
            dioException: dioException,
            message: message);
  const RefreshHomeBookError.fromGenericError(dynamic genericError, List<PhysicalBookModel> rollbackBooks)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [statusCode, allBooks, dioException, message, genericError];
}

final class HomeBooksError extends HomeBooksState {

  const HomeBooksError(DioException dioException,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioException: dioException, message: message);
  const HomeBooksError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [dioException, genericError, statusCode, message];
}
