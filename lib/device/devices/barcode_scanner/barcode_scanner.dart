import 'package:bookpal/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner {
  Future<String> scanBarcode(BuildContext context) async {
    try {
      // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      //   "#ff6666",
      //   "Cancel",
      //   true,
      //   ScanMode.BARCODE,
      // );
      String barcodeScanRes = await Future.delayed(
          const Duration(seconds: 2), () => "28098300000001");
      logger.d("Barcode: $barcodeScanRes");
      return barcodeScanRes;
    } on PlatformException catch (e) {
      logger.e('Platform messages failed: $e');
      rethrow;
    }
  }
}
