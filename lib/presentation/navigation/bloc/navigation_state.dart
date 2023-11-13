part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {

  final int index;
  final Widget? nextPage;

  const NavigationState({required this.index, this.nextPage});
  
  @override
  List<Object?> get props => [index, nextPage];
}

final class InHomePage extends NavigationState {
  const InHomePage({int index = 0}) : super(index: index);
}

final class InBorrowedPage extends NavigationState {
  const InBorrowedPage({int index = 1}) : super(index: index);
}

final class InFavoritesPage extends NavigationState {
  const InFavoritesPage({int index = 2}) : super(index: index);
}

final class InProfilePage extends NavigationState {
  const InProfilePage({int index = 3}) : super(index: index);
}

final class InAuthPage extends NavigationState {
  const InAuthPage({int index = 3}) : super(index: index);
}


