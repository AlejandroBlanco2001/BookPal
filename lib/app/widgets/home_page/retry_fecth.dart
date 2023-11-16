import 'package:flutter/material.dart';

class RetryFetch extends StatelessWidget {
  const RetryFetch({super.key, required this.fetchMethod});

  final Function fetchMethod;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Could not load books. Retry...',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () => fetchMethod,
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      ),
    );
  }
}
