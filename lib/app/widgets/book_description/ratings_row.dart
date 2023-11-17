import 'package:bookpal/app/widgets/book_description/star.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:flutter/material.dart';

class RatingsRow extends StatelessWidget {
  const RatingsRow({super.key, required this.book});

  final PhysicalBookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Row(
        children: <Widget>[...List.generate(
              7,
              (index) {
                var rating = book.rating ?? 4;
                var ratings = book.ratings ??
                    List.filled(27, {'key': 'value'}, growable: false);
                if (index < 5) {
                  return Star(colored: index < rating);
                } else if (index == 5) {
                  return TextContainer(text: rating.toString());
                } else {
                  return TextContainer(text: '(${ratings.length.toString()})');
                }
              },
            )],
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 14,
        ),
      ),
    );
  }
}
