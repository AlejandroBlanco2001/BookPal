import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookpal/domain/usecases/scanning/read_nfc_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:nfc_manager/nfc_manager.dart';

part 'nfc_event.dart';
part 'nfc_state.dart';

class NfcBloc extends Bloc<NfcEvent, NfcState> {

  final ReadNfcUsecase _readNfc;

  NfcBloc(this._readNfc) : super(NfcInitial()) {
    on<NfcEvent>(onScanNFC);
  }

  FutureOr<void> onScanNFC(NfcEvent event, Emitter<NfcState> emit) async {
    emit(NfcScanning());
    try {
      final ndefMessage = await _readNfc();
      if (ndefMessage.records.isEmpty) {
        throw Exception('Empty response from nfc adapter');
      }
      emit(NfcScanned(ndefMessage: ndefMessage, identifier: ndefMessage.records[0].payload.toString()));
    } catch (e) {
      emit(NfcError(error: e as Exception));
    }
  }
}
