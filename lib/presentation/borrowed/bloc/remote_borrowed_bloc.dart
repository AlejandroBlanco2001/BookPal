import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_borrowed_event.dart';
part 'remote_borrowed_state.dart';

class RemoteBorrowedBloc extends Bloc<RemoteBorrowedEvent, RemoteBorrowedState> {
  RemoteBorrowedBloc() : super(RemoteBorrowedInitial()) {
    on<RemoteBorrowedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
