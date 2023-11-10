import 'package:bookpal/presentation/barcode/bloc/barcode_bloc.dart';
import 'package:bookpal/presentation/nfc/bloc/nfc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanMethodsMenu extends StatelessWidget {
  const ScanMethodsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicWidth(
          child: Container(
            height: 50,
            color: Colors.lightBlue,
            child: TextButton(
              onPressed: () {
                // Navigator.pop(context);
                context.read<BarcodeBloc>().add(ScanBarcode());
              },
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(CupertinoIcons.barcode_viewfinder),
                    ),
                    Text(
                      'Scan barcode',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        IntrinsicWidth(
          child: Container(
            height: 50,
            color: Colors.blueAccent,
            child: TextButton(
              onPressed: () {
                // Navigator.pop(context);
                context.read<NfcBloc>().add(ScanNfc());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(IconData(0xe42b, fontFamily: 'MaterialIcons')),
                  ),
                  Text(
                    'Scan NFC tag',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
