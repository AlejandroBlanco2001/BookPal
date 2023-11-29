part of 'qr_bloc.dart';

sealed class QREvent extends Equatable {
  const QREvent();

  @override
  List<Object> get props => [];
}

final class ScanQR extends QREvent {
  const ScanQR();

  @override
  List<Object> get props => [];
}