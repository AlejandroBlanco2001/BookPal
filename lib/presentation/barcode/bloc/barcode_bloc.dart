import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/device/devices/barcode_scanner/barcode_scanner.dart';
import 'package:equatable/equatable.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final BarcodeScanner _barcodeScanner;

  BarcodeBloc(this._barcodeScanner) : super(BarcodeInitial()) {
    on<ScanBarcode>(onScanBarcode);
  }

  FutureOr<void> onScanBarcode(
      ScanBarcode event, Emitter<BarcodeState> emit) async {
    emit(ScanningBarcode());
    try {
      final barcodeScanRes = await _barcodeScanner.scanBarcode();
      if (barcodeScanRes.isEmpty) {
        throw Exception('Empty response from barcode scanner');
      }
      emit(BarcodeScanned(barcodeScanRes: barcodeScanRes));
    } catch (e) {
      emit(BarcodeError(error: e as Exception));
    }
  }
}
