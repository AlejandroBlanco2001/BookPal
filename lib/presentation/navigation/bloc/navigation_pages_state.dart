part of 'navigation_pages_bloc.dart';

sealed class NavigationPagesState extends Equatable {
  final List<Widget> pages;
  final List<NavigationDestination> navBar;

  const NavigationPagesState({required this.pages, required this.navBar});

  @override
  List<Object?> get props => [pages, navBar];
}

final class NavigationPagesInitial extends NavigationPagesState {
  const NavigationPagesInitial()
      : super(pages: const [
          BookPalHomePage(),
          LoginPage()
        ], navBar: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.login_outlined),
            label: 'Login',
          )
        ]);
}

final class NavigationPagesLoggedIn extends NavigationPagesState {
  const NavigationPagesLoggedIn()
      : super(
          pages: const [
            BookPalHomePage(),
            Borrowed(),
            Favorites(),
            ProfilePage()
          ],
          navBar: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.book_outlined), label: 'Borrowed'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
            NavigationDestination(
                icon: Icon(Icons.person_outlined), label: 'Profile')
          ],
        );
}
