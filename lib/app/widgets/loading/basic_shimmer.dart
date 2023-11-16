import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ThemeShimmer extends StatelessWidget {
  const ThemeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primaryContainer,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}