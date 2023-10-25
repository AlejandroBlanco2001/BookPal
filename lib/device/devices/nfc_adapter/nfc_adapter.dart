import 'package:nfc_manager/nfc_manager.dart';

class NfcAdapter {
  Future<NdefMessage?> readNdef() async {
    await NfcManager.instance.isAvailable();
    NdefMessage? message;

    // Start Session
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        Ndef? ndef = Ndef.from(tag);
        if (ndef == null) {
          return;
        }
        message = await ndef.read();
      },
    );
    // Stop Session
    NfcManager.instance.stopSession();

    return message;
  }
}
