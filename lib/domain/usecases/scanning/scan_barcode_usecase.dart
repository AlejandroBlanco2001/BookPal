import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/device/devices/barcode_scanner/barcode_scanner.dart';

class ScanBarcodeUsecase extends Usecase<String>{
  @override
  Future<String> call({Map<String, dynamic>? params}) {
    return BarcodeScanner().scanBarcode(params!['context']);
  }
}