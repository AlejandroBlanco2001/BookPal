import 'package:bookpal/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookSynopsis extends StatefulWidget {
  const BookSynopsis({super.key});

  @override
  State<BookSynopsis> createState() => _BookSynopsisState();
}

class _BookSynopsisState extends State<BookSynopsis> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'Synopsis:',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AnimatedCrossFade(
            firstChild: SizedBox(
              height: 100,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Text(
                    textPlaceholder,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            secondChild: IntrinsicHeight(
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Text(
                    textPlaceholder,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            crossFadeState: (!_isExpanded)
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: _toggleExpand,
              splashFactory: InkSplash.splashFactory,
              radius: 5,
              child: Text(
                (!_isExpanded) ? "See more" : "See less",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
