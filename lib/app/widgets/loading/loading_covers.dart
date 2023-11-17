import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardsListShimmer extends StatelessWidget {
  const CardsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CoverCardShimmer();
      },
    );
  }
}

class CoverCardShimmer extends StatelessWidget {
  const CoverCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).highlightColor,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300]!.withOpacity(.7),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
