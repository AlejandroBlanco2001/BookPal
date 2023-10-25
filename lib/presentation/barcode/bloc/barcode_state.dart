part of 'barcode_bloc.dart';

sealed class BarcodeState extends Equatable {

  final String? barcodeScanRes;
  final Exception? error;

  const BarcodeState({
    this.barcodeScanRes,
    this.error,
  });

  @override
  List<Object?> get props => [barcodeScanRes, error];
}

final class BarcodeInitial extends BarcodeState {}

final class ScanningBarcode extends BarcodeState {}

final class BarcodeScanned extends BarcodeState {
  const BarcodeScanned({
    required String barcodeScanRes,
  }) : super(barcodeScanRes: barcodeScanRes);
}

final class BarcodeError extends BarcodeState {
  const BarcodeError({
    required Exception error,
  }) : super(error: error);
}
