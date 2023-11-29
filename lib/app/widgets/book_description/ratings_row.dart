import 'package:bookpal/app/widgets/book_description/star.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:flutter/material.dart';

class RatingsRow extends StatefulWidget {
  const RatingsRow({super.key, required this.book});

  final PhysicalBookModel book;

  @override
  State<RatingsRow> createState() => _RatingsRowState();
}

class _RatingsRowState extends State<RatingsRow> {

  PhysicalBookModel get book => widget.book;

  @override
  Widget build(BuildContext context) {
    var rating = widget.book.rating ?? 0;
    var ratings = widget.book.ratings ?? [];
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Row(
        children: <Widget>[
          ...List.generate(
            5,
            (index) {
              return Star(colored: index < rating.floor());
            },
          ),
          TextContainer(text: rating.toStringAsPrecision(2)),
          TextContainer(text: '(${ratings.length.toString()})')
        ],
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
