import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).highlightColor,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 5,
              color: Colors.grey[400]!.withOpacity(.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const SizedBox(
                height: 110,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: -15,
              left: 15,
              child: Container(
                height: 110,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
