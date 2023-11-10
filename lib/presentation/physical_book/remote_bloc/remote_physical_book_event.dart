part of 'remote_physical_book_bloc.dart';

sealed class RemotePhysicalBookEvent extends Equatable {
  const RemotePhysicalBookEvent();

  @override
  List<Object> get props => [];
}

final class InitPhysicalBook extends RemotePhysicalBookEvent {}

final class GetPhysicalBook extends RemotePhysicalBookEvent {
  final dynamic identifier;

  const GetPhysicalBook(this.identifier);

  @override
  List<Object> get props => [identifier];
}

final class GetAllPhysicalBooks extends RemotePhysicalBookEvent {
  final int pageSize;

  const GetAllPhysicalBooks({this.pageSize = 10});

  @override
  List<Object> get props => [pageSize];
}