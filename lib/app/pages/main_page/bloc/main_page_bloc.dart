import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<MainPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
