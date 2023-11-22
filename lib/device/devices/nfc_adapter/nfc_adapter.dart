import 'dart:async';

import 'package:bookpal/core/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcAdapter {
  Future<NdefMessage?> readNdefMessage() async {
    try {
      var available = await NfcManager.instance.isAvailable();
      logger.d("NFC Available: $available");

      StreamController<NdefMessage?> controller =
          StreamController<NdefMessage?>();

      NfcManager instance = NfcManager.instance;

      // Start Session
      instance.startSession(
        onDiscovered: (NfcTag tag) async {
          Ndef? ndef = Ndef.from(tag);
          if (ndef == null) {
            return;
          }
          if (ndef.cachedMessage != null) {
            String tempRecord = "";
            for (var record in ndef.cachedMessage!.records) {
              tempRecord =
              "$tempRecord ${String.fromCharCodes(record.payload.sublist(record.payload[0] + 1))}";
            }
            logger.d(tempRecord);
            // TODO: controller.add(tempRecord)
          } else {
            logger.d("Missing data");
            // TODO: Handle this
          }
          instance.stopSession();
          controller.close();
        },
        alertMessage: "Approach a tag to the back of your phone.",
        onError: (error) async => logger.d("Error in adapter: $error"),
      );

      Timer(const Duration(seconds: 10), () {
        if (!controller.isClosed) {
          logger.d("Stopping session");
          instance.stopSession();
          controller.addError('Timeout occured');
          controller.close();
        }
      });

      return controller.stream.first;
    } on PlatformException catch (e){
      logger.d("Platform exception: $e");
      rethrow;
    } catch (e) {
      logger.e("Error in adapter: $e");
      rethrow;
    }
  }
}
