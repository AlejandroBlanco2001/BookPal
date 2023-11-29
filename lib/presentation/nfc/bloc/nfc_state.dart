part of 'nfc_bloc.dart';

sealed class NfcState extends Equatable {
  final String? ndefMessage;
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
  const NfcScanned(
    String identifier,
  ) : super(identifier: identifier);
}

final class NfcError extends NfcState {
  const NfcError({
    required Exception error,
  }) : super(error: error);
}
