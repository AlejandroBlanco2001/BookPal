import 'package:bookpal/app/widgets/home_page/book_item.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {

  const BookRow({Key? key, required this.coverUrl, required this.title, required this.author}) : super(key: key);

  final String coverUrl ;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 0),
      child: BookItem(
        imageUrl: coverUrl,
        title: title,
        author: author,
      ),
    );
  }
}
