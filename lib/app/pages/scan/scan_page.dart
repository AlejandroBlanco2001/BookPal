import 'package:flutter/material.dart';
import 'package:bookpal/app/widgets/nfc_scanner.dart';
import 'package:bookpal/app/widgets/barcode_scanner.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6.0, 12.0, 12.0, 0),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 24,
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(32, 32, 32, 16),
          alignment: Alignment.topLeft,
          child: const Text(
            'Scanner',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(32, 16, 32, 0),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(150, 127, 98, 153),
          ),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const BarCodeScanner();
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3612/3612359.png',
                      color: Colors.white,
                    )),
                const Text(
                  'Scan by barcode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(32, 16, 32, 0),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(150, 72, 184, 200),
          ),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const NFCScanner();
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                      'https://cdn1.iconfinder.com/data/icons/banking-36/128/contactless_pay_pass_nfc_payment__Mobile_phone_-512.png',
                      color: Colors.white,
                    )),
                const Text(
                  'Scan by NFC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
