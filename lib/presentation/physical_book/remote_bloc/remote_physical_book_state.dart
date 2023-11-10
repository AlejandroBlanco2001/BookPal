part of 'remote_physical_book_bloc.dart';

sealed class RemotePhysicalBookState extends Equatable {
  final PhysicalBookModel? physicalBook;
  final List<PhysicalBookModel>? physicalBooks;
  final DioException? dioError;
  final dynamic genericError;
  final int? statusCode;
  final List<String>? message;

  const RemotePhysicalBookState({
    this.physicalBook,
    this.physicalBooks,
    this.dioError,
    this.genericError,
    this.statusCode,
    this.message,
  });

  @override
  List<Object?> get props => [
        physicalBook,
        physicalBooks,
        dioError,
        genericError,
        statusCode,
        message
      ];
}

final class RemotePhysicalBookInitial extends RemotePhysicalBookState {}

final class RemotePhysicalBookLoading extends RemotePhysicalBookState {}

final class RemotePhysicalBookLoaded extends RemotePhysicalBookState {
  const RemotePhysicalBookLoaded(int statusCode, PhysicalBookModel physicalBook)
      : super(statusCode: statusCode, physicalBook: physicalBook);

  @override
  List<Object?> get props => [statusCode, physicalBook];
}

final class RemotePhysicalBooksLoaded extends RemotePhysicalBookState {
  const RemotePhysicalBooksLoaded(
      int statusCode, List<PhysicalBookModel> physicalBooks)
      : super(statusCode: statusCode, physicalBooks: physicalBooks);

  @override
  List<Object?> get props => [statusCode, physicalBooks];
}

final class RemotePhysicalBookError extends RemotePhysicalBookState {
  const RemotePhysicalBookError(DioException dioError,
      [int? statusCode, List<String>? message])
      : super(statusCode: statusCode, dioError: dioError, message: message);
  const RemotePhysicalBookError.genericError(dynamic genericError)
      : super(genericError: genericError);

  @override
  List<Object?> get props => [dioError, genericError, statusCode, message];
}
