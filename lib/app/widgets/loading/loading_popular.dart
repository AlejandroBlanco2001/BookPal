import 'package:bookpal/app/widgets/loading/book_row.dart';
import 'package:flutter/material.dart';

class PopularBooksShimmer extends StatelessWidget {
  const PopularBooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: const Padding(
              padding: EdgeInsets.fromLTRB(24.0, 0.0, 24, 0),
              child: BookRowShimmer()),
        );
      },
    );
  }
}
