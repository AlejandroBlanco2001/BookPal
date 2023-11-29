part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  final List<PhysicalBookModel> books;
  final String? query;
  final DioException? dioError;
  final int? statusCode;
  final List<String>? message;
  final dynamic genericError;

  const SearchState({
    this.books = const [],
    this.query,
    this.dioError,
    this.statusCode,
    this.message,
    this.genericError,
  });

  @override
  List<Object?> get props =>
      [books, query, dioError, statusCode, message, genericError];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  const SearchLoaded(
      int statusCode, List<PhysicalBookModel> books, String query)
      : super(statusCode: statusCode, books: books, query: query);

  @override
  List<Object?> get props => [statusCode, books, query];
}

final class SearchError extends SearchState {
  const SearchError(DioException dioError, String query,
      [int? statusCode, List<String>? message])
      : super(
          dioError: dioError,
          statusCode: statusCode,
          message: message,
          query: query,
        );
  const SearchError.genericError(dynamic genericError, String query)
      : super(genericError: genericError, query: query);

  @override
  List<Object?> get props => [dioError, statusCode, message, genericError];
}
