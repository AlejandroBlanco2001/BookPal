import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/domain/usecases/scanning/scan_qr_usecase.dart';
import 'package:equatable/equatable.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QRBloc extends Bloc<QREvent, QRState> {
  final ScanQRUsecase _scanQR;

  QRBloc(this._scanQR) : super(QRInitial()) {
    on<ScanQR>(onScanQR);
  }

  FutureOr<void> onScanQR(ScanQR event, Emitter<QRState> emit) async {
    emit(ScanningQR());
    try {
      final qrScanRes = await _scanQR();
      if (qrScanRes.isEmpty) {
        emit(QRError(error: Exception('Empty response from qr scanner')));
      }
      emit(QRScanned(qrScanRes: qrScanRes));
    } catch (e) {
      logger.e("Error: $e.\nStacktrace: ${(e as Error).stackTrace}");
      emit(QRError(error: e as Exception));
    }
  }
}
