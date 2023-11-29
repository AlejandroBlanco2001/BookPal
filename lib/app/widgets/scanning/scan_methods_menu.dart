import 'package:bookpal/data/enums/book_scan_method.dart';
import 'package:bookpal/presentation/barcode/bloc/barcode_bloc.dart';
import 'package:bookpal/presentation/company/remote_bloc/remote_company_bloc.dart';
import 'package:bookpal/presentation/nfc/bloc/nfc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanMethodsMenu extends StatelessWidget {
  const ScanMethodsMenu({super.key, required this.enabledScanMethods});

  final List<BookScanMethod> enabledScanMethods;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteCompanyBloc, RemoteCompanyState>(
      builder: (context, state) {
        if (state is RemoteCompanyLoaded) {
          var buttons = <Widget>[];
          for (var scanMethod in enabledScanMethods) {
            buttons.add(MenuButton(type: scanMethod.name));
          }
          return Column(
            children: buttons,
          );
        }
        return const Column(
          children: [MenuButton(type: 'loading')],
        );
      },
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 50,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (type == 'rfid') {
              context.read<NfcBloc>().add(ScanNfc());
            } else if (type == 'barcode') {
              context.read<BarcodeBloc>().add(const ScanBarcode());
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon((type == 'rfid')
                    ? const IconData(0xe42b, fontFamily: 'MaterialIcons')
                    : CupertinoIcons.barcode_viewfinder),
              ),
              Text(
                (type == 'rfid') ? 'Scan NFC tag' : 'Scan barcode',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
