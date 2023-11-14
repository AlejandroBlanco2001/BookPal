import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/app/widgets/home_page/book_item.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {
  const BookRow(
      {Key? key,
      required this.coverUrl,
      required this.title,
      required this.author})
      : super(key: key);

  final String coverUrl;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookDescription(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 6.0, 0, 6),
          child: Ink(
            child: BookItem(
              imageUrl: coverUrl,
              title: title,
              author: author,
            ),
          ),
        ),
      ),
    );
  }
}
