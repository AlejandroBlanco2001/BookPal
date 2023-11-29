import 'package:bookpal/core/usecases/usecase.dart';
import 'package:bookpal/device/devices/nfc_adapter/nfc_adapter.dart';

class ReadNfcUsecase extends Usecase<String> {
  @override
  Future<String> call({void params}) async {
    String message = await NfcAdapter().readNdefMessage() ?? '';
    return message;
  }
}
