part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class ToHomePage extends NavigationEvent {}

final class SwapPage extends NavigationEvent {
  final int index;

  const SwapPage(this.index);

  @override
  List<Object> get props => [index];
}
