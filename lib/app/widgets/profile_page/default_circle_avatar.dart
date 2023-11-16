import 'package:flutter/material.dart';

class DefaultCircleAvatar extends StatelessWidget {
  const DefaultCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/images/default_avatar.jpg'),
      radius: 35,
      backgroundColor: Colors.white,
    );
  }
}
