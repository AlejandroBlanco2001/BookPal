import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
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
    context.read<LoginBloc>().add(const Login("florix@gmail.com", "B00rgir_9116"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteLoanBloc, RemoteLoanState>(
      builder: (context, state) {
        if (state is RemoteLoanLoading) {
          logger.i("Loading...");
        } else if (state is RemoteLoanCreated) {
          logger.i("Loans by user ${53}: ${state.loan}");
        } else if (state is RemoteLoanError) {
          logger.e(
              "Error code: ${state.statusCode}, error message: ${state.message}");
        }
        return NavigationBar(
          selectedIndex: widget.currentIndex,
          onDestinationSelected: widget.onTabSelected,
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Icons.book_outlined),
              label: 'Borrowed',
            ),
            const NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorites',
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginSuccess) {
                  return const NavigationDestination(
                    icon: Icon(Icons.person_outlined),
                    label: 'Profile',
                  );
                } else {
                  return const NavigationDestination(
                    icon: Icon(Icons.login_outlined),
                    label: 'Login',
                  );
                }
              }, 
            ),
          ],
        );
      },
    );
  }
}
