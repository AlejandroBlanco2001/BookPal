import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<CompanyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
