import 'package:bookpal/app/widgets/loading/book_card_shimmer.dart';
import 'package:flutter/material.dart';

class ListBooksShimmer extends StatelessWidget {
  const ListBooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return const BookCardShimmer();
      },
    );
  }
}