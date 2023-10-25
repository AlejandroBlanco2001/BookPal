part of 'barcode_bloc.dart';

sealed class BarcodeEvent extends Equatable {
  const BarcodeEvent();

  @override
  List<Object> get props => [];
}

final class ScanBarcode extends BarcodeEvent {}

