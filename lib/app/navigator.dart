import 'package:bookpal/app/widgets/scanning/select_scan_method_button.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_pages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bookpal/app/widgets/navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navState) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            if (loginState is LoginSuccess) {
              context.read<NavigationPagesBloc>().add(const LoggedIn());
            } else if (loginState is LoginInitial || loginState is LoginError) {
              context.read<NavigationPagesBloc>().add(const NotLoggedIn());
            }
            return BlocBuilder<NavigationPagesBloc, NavigationPagesState>(
              builder: (context, navPagesState) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  floatingActionButton: const SelectScanMethodButton(),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  body: IndexedStack(
                    index: navState.index,
                    children: navPagesState.pages,
                  ),
                  bottomNavigationBar: Visibility(
                    visible: MediaQuery.of(context).viewInsets.bottom == 0,
                    child: MainNavigationBar(
                      currentIndex: navState.index,
                      onTabSelected: _swapPage,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  _swapPage(int index) => context.read<NavigationBloc>().add(SwapPage(index));
}
