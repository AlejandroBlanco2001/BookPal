import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
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
  }
}
