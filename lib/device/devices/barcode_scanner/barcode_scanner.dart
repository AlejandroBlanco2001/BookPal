import 'package:bookpal/core/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner {
  Future<String> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      ).timeout(const Duration(seconds: 2), onTimeout: () {
        return "978-3-16-148410-0";
      });
      return barcodeScanRes;
    } on PlatformException catch (e) {
      logger.e('Platform messages failed: $e');
      rethrow;
    }
  }
}
