part of 'barcode_bloc.dart';

sealed class BarcodeEvent extends Equatable {
  const BarcodeEvent();

  @override
  List<Object> get props => [];
}

final class ScanBarcode extends BarcodeEvent {
  final BuildContext context;

  const ScanBarcode(this.context);

  @override
  List<Object> get props => [context];
}

