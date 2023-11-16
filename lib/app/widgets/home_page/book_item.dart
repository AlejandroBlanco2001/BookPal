
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
          radius: 37,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                author,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Fiction',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ],
    );
  }
}
