import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star(
      {super.key, required this.colored, this.fontSize, this.shadows = false});

  final bool colored;
  final double? fontSize;
  final bool shadows;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2.0),
      child: Icon(
        Icons.star,
        color: (colored) ? Colors.yellow : Colors.grey,
        size: fontSize ?? 14,
        shadows: (shadows)
            ? [
                Shadow(
                  color: Colors.black.withOpacity(.45),
                  blurRadius: 4.0,
                  offset: const Offset(2, 2),
                ),
              ]
            : [],
      ),
    );
  }
}
