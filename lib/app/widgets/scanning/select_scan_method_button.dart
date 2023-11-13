import 'package:bookpal/app/widgets/scanning/scan_methods_menu.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class SelectScanMethodButton extends StatelessWidget {
  const SelectScanMethodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => showPopover(
          context: context, 
          direction: PopoverDirection.top,
          height: 100,
          backgroundColor: Colors.blue,
          bodyBuilder: (context) => const ScanMethodsMenu(),
        ),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.document_scanner_outlined),
      );
  }
}