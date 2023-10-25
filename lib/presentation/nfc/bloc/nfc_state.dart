part of 'nfc_bloc.dart';

sealed class NfcState extends Equatable {

  final NdefMessage? ndefMessage;
  final String? identifier;
  final Exception? error;

  const NfcState({
    this.ndefMessage,
    this.identifier,
    this.error,
  });
  
  @override
  List<Object?> get props => [ndefMessage, identifier, error];
}

final class NfcInitial extends NfcState {}

final class NfcScanning extends NfcState {}

final class NfcScanned extends NfcState {
  const NfcScanned({
    required NdefMessage ndefMessage,
    required String identifier,
  }) : super(ndefMessage: ndefMessage, identifier: identifier);
}

final class NfcError extends NfcState {
  const NfcError({
    required Exception error,
  }) : super(error: error);
}
