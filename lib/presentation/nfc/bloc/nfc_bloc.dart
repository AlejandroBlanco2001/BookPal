import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/domain/usecases/scanning/read_nfc_usecase.dart';
import 'package:equatable/equatable.dart';

part 'nfc_event.dart';
part 'nfc_state.dart';

class NfcBloc extends Bloc<NfcEvent, NfcState> {

  final ReadNfcUsecase _readNfc;

  NfcBloc(this._readNfc) : super(NfcInitial()) {
    on<NfcEvent>(onScanNFC);
  }

  FutureOr<void> onScanNFC(NfcEvent event, Emitter<NfcState> emit) async {
    emit(NfcScanning());
    logger.d("Scanning NFC");
    try {
      final nfcResult = await _readNfc();
      logger.d("Result: $nfcResult");
      if (nfcResult == '' || nfcResult.isEmpty) {
        throw Exception('Empty response from nfc adapter');
      }
      emit(NfcScanned(nfcResult.trim()));
    } catch (e) {
      logger.d("Error: $e");
      emit(NfcError(error: Exception(e)));
    }
  }
}
