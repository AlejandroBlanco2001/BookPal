import 'package:flutter/material.dart';

class SuccessfulDialog extends StatelessWidget {
  const SuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 61, 63, 84),
      title: const Text('Your book has been borrowed successfully!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      content: SizedBox(
        height: 300,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              'https://images.freeimages.com/fic/images/icons/2799/flat_icons/256/book_checkmark.png',
              height: 200,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 40, 42, 65),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Close'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
