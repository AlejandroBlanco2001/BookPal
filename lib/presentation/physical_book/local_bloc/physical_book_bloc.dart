import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'physical_book_event.dart';
part 'physical_book_state.dart';

class PhysicalBookBloc extends Bloc<PhysicalBookEvent, PhysicalBookState> {
  PhysicalBookBloc() : super(PhysicalBookInitial()) {
    on<PhysicalBookEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
