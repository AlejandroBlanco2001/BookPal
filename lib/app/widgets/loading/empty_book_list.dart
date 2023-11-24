import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyBookList extends StatelessWidget {
  const EmptyBookList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:
                  Lottie.asset('assets/icons/book.json', height: 70, width: 70),
            ),
          ],
        ),
      ),
    );
  }
}
