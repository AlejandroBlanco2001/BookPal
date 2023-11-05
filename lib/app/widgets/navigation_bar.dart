import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
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
    context.read<LoginBloc>().add(const Login("florix@gmail.com", "Kku_333#4444"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          logger.i("Loading...");
        } else if (state is LoginSuccess) {
          logger.i("Json Web Token: ${state.jwt}");
        } else if (state is LoginError) {
          logger.e(
              "Error code: ${state.statusCode}, error message: ${state.message}");
        }
        return NavigationBar(
          selectedIndex: widget.currentIndex,
          onDestinationSelected: widget.onTabSelected,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              label: 'Borrowed',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
