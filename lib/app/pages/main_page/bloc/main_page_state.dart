part of 'main_page_bloc.dart';

sealed class MainPageState extends Equatable {
  const MainPageState();
  
  @override
  List<Object> get props => [];
}

final class MainPageInitial extends MainPageState {}
