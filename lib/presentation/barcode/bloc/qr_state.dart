part of 'qr_bloc.dart';

sealed class QRState extends Equatable {

  final String? qrScanRes;
  final Exception? error;

  const QRState({
    this.qrScanRes,
    this.error,
  });

  @override
  List<Object?> get props => [qrScanRes, error];
}

final class QRInitial extends QRState {}

final class ScanningQR extends QRState {}

final class QRScanned extends QRState {
  const QRScanned({
    required String qrScanRes,
  }) : super(qrScanRes: qrScanRes);
}

final class QRError extends QRState {
  const QRError({
    required Exception error,
  }) : super(error: error);
}
