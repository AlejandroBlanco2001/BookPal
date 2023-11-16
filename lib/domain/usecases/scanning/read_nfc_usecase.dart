import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/device/devices/nfc_adapter/nfc_adapter.dart';
import 'package:nfc_manager/nfc_manager.dart';

class ReadNfcUsecase extends Usecase<NdefMessage> {
  @override
  Future<NdefMessage> call({void params}) async {
    NdefMessage? message = await NfcAdapter().readNdefMessage();
    return message  ?? const NdefMessage([]);
  }
}
