import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/device/devices/nfc_adapter/nfc_adapter.dart';
import 'package:equatable/equatable.dart';
import 'package:nfc_manager/nfc_manager.dart';

part 'nfc_event.dart';
part 'nfc_state.dart';

class NfcBloc extends Bloc<NfcEvent, NfcState> {

  final NfcAdapter _nfcAdapter;

  NfcBloc(this._nfcAdapter) : super(NfcInitial()) {
    on<NfcEvent>(onScanNFC);
  }

  FutureOr<void> onScanNFC(NfcEvent event, Emitter<NfcState> emit) async {
    emit(NfcScanning());
    try {
      final ndefMessage = await _nfcAdapter.readNdefMessage();
      if (ndefMessage == null) {
        throw Exception('Empty response from nfc adapter');
      }
      emit(NfcScanned(ndefMessage: ndefMessage, identifier: ndefMessage.records[0].payload.toString()));
    } catch (e) {
      emit(NfcError(error: e as Exception));
    }
  }
}
