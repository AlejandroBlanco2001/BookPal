import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/domain/usecases/scanning/scan_barcode_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final ScanBarcodeUsecase _scanBarcode;

  BarcodeBloc(this._scanBarcode) : super(BarcodeInitial()) {
    on<ScanBarcode>(onScanBarcode);
  }

  FutureOr<void> onScanBarcode(
      ScanBarcode event, Emitter<BarcodeState> emit) async {
    emit(ScanningBarcode());
    try {
      final barcodeScanRes =
          await _scanBarcode(params: {'context': event.context});
      if (barcodeScanRes.isEmpty) {
        throw Exception('Empty response from barcode scanner');
      }
      emit(BarcodeScanned(barcodeScanRes: barcodeScanRes));
    } catch (e) {
      logger.e("Error: $e.\nStacktrace: ${(e as Error).stackTrace}");
      emit(BarcodeError(error: e as Exception));
    }
  }
}
