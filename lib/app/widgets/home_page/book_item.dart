
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const BookItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 35,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              author,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Fiction',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
