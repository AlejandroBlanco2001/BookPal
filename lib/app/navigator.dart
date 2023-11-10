import 'package:bookpal/app/pages/authentication/login_page.dart';
import 'package:bookpal/app/pages/user_profile/user_profile.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bookpal/app/pages/home/home_page.dart';
import 'package:bookpal/app/pages/borrowed/borrowed_page.dart';
import 'package:bookpal/app/pages/favorites/favorites_page.dart';
import 'package:bookpal/app/widgets/navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    const BookPalHomePage(),
    const Borrowed(),
    const Favorites(),
    const LoginPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          _pages[3] = const ProfilePage();
        } else if (state is LoginInitial) {
          _pages[3] = const LoginPage();
        } 
        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: MainNavigationBar(
            currentIndex: _currentIndex,
            onTabSelected: _onTabTapped,
          ),
        );
      },
    );
  }
}
