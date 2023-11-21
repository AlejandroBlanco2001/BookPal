import 'package:bookpal/app/widgets/book_description/star.dart';
import 'package:flutter/material.dart';

class RatingMenu extends StatefulWidget {
  const RatingMenu({super.key});

  @override
  State<RatingMenu> createState() => _RatingMenuState();
}

class _RatingMenuState extends State<RatingMenu> {
  double _rating = 0.0;

  void upateRating(double newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  bool colored(int index) {
    return index < _rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate this book:',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: List.generate(
              6,
              (index) => (index < 5)
                  ? Star(
                      colored: colored(index),
                      fontSize: 35,
                    )
                  : Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        '(${_rating.toStringAsPrecision(2)})',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 18,
                        ),
                      ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
