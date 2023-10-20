import 'package:flutter/material.dart';

class NFCScanner extends StatelessWidget {
  const NFCScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 61, 63, 84),
      title: const Text('Ready to Scan',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      content: SizedBox(
        height: 350,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              'https://www.freeiconspng.com/thumbs/nfc-icon/nfc-icon-6.png',
              height: 200,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Place your phone near the NFC tag',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
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
                child: const Text('Cancel'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
