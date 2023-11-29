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

}
