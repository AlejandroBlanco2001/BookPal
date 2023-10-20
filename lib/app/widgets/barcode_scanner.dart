import 'package:flutter/material.dart';

class BarCodeScanner extends StatelessWidget {
  const BarCodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 61, 63, 84),
      title: const Text('Scan the Barcode',
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
              'https://lh3.googleusercontent.com/pw/ADCreHdOFtUUbyBd6nfsIU-Gla4blGHLxccyZdWXcR9-CoaVuBflxGS4YBhOLIECE8sHH_ZxgIaSpul4lWA8n6pt1mujMpmlYMnOf_ecg4IeMZihxdXAlw1qOnAo_nJD18HQHEUuiD_vAakTXZVHinUnNHti=w358-h233-s-no-gm?authuser=0',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Line up the barcode with the red corners and keep the phone steady',
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
