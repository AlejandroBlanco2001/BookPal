import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({super.key, required this.colored, this.fontSize});

  final bool colored;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2.0),
      child: Icon(
        Icons.star,
        color: (colored) ? Colors.yellow : Colors.grey,
        size: fontSize ?? 14,
      ),
    );
  }
}
