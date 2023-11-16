import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_pages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({
    Key? key,
    required this.onTabSelected,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) onTabSelected;
  final int currentIndex;

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  @override
  void initState() {
    super.initState();
    // context.read<LoginBloc>().add(const Login("florix@gmail.com", "B00rgir_9116"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPagesBloc, NavigationPagesState>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: widget.currentIndex,
          onDestinationSelected: widget.onTabSelected,
          destinations: state.navBar,
        );
      },
    );
  }

  _createDestinationsList(LoginState state) {
    List<NavigationDestination> destinations = [
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      )
    ];
    if (state is LoginSuccess) {
      destinations.add(const NavigationDestination(
        icon: Icon(Icons.book_outlined),
        label: 'Borrowed',
      ));
      destinations.add(const NavigationDestination(
        icon: Icon(Icons.favorite_border_outlined),
        label: 'Favorites',
      ));
      destinations.add(const NavigationDestination(
        icon: Icon(Icons.person_outlined),
        label: 'Profile',
      ));
    } else {
      destinations.add(const NavigationDestination(
        icon: Icon(Icons.login_outlined),
        label: 'Login',
      ));
    }
    return destinations;
  }
}
