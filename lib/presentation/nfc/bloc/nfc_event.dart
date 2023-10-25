part of 'nfc_bloc.dart';

sealed class NfcEvent extends Equatable {
  const NfcEvent();

  @override
  List<Object> get props => [];
}

final class ScanNfc extends NfcEvent {}
