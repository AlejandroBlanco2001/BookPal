import 'package:flutter/material.dart';

class BookSearchField extends StatelessWidget {
  const BookSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for books',
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
