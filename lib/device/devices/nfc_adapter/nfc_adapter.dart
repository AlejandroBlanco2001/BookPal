import 'package:bookpal/core/constants/constants.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcAdapter {
  Future<NdefMessage?> readNdefMessage() async {
    var available = await NfcManager.instance.isAvailable();
    logger.d("NFC Available: $available");
    NdefMessage? message;

    // Start Session
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        Ndef? ndef = Ndef.from(tag);
        if (ndef == null) {
          return;
        }
        logger.d("Reading tag");
        message = await ndef.read();
      },
      alertMessage: "Approach a tag to the back of your phone.",
      onError: (error) async => logger.d("Error in adapter: $error"),
    );
    logger.d("Stopping session");
    // Stop Session
    NfcManager.instance.stopSession();

    logger.d("Returning message with: $message");
    return message;
  }
}
