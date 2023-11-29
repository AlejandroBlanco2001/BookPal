part of 'navigation_pages_bloc.dart';

sealed class NavigationPagesEvent extends Equatable {
  const NavigationPagesEvent();

  @override
  List<Object> get props => [];
}

final class LoggedIn extends NavigationPagesEvent {
  const LoggedIn();
}

final class NotLoggedIn extends NavigationPagesEvent {
  const NotLoggedIn();
}
