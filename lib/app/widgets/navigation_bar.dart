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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        NavigationBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.transparent,
          indicatorColor: Colors.transparent,
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
              icon: Icon(Icons.qr_code_scanner_outlined),
              label: '',
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
        ),
        // circle PopupMenuButton
        Positioned(
          top: -20,
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            elevation: 20,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {
                  widget.onTabSelected(2);
                },
                icon: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
