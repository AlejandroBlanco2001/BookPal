import 'package:flutter/material.dart';
import 'package:bookpal/app/pages/home/home_page.dart';
import 'package:bookpal/app/pages/borrowed/borrowed_page.dart';
import 'package:bookpal/app/pages/favorites/favorites_page.dart';
import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/widgets/navigation_bar.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    BookPalHomePage(),
    Borrowed(),
    Favorites(),
    BookDescription(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
