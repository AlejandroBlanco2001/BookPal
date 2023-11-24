import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookRowShimmer extends StatelessWidget {
  const BookRowShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double coverWidth = MediaQuery.of(context).size.width * .155;
    double coverHeight = coverWidth * (4 / 3);
    return Shimmer.fromColors(
      baseColor: Theme.of(context).highlightColor,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: coverWidth,
              height: coverHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300]!.withOpacity(.7),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!.withOpacity(.7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!.withOpacity(.7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.onPrimary.withOpacity(.7),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!.withOpacity(.7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}