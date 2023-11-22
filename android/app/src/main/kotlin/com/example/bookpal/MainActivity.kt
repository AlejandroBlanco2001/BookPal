package com.example.bookpal

import android.app.PendingIntent
import android.content.Intent
import android.nfc.NfcAdapter
import io.flutter.embedding.android.FlutterActivity

// Extracted from https://github.com/okadan/nfc-manager/blob/master/android/app/src/main/kotlin/com/naokiokada/nfcmanager/MainActivity.kt
class MainActivity: FlutterActivity() {
  override fun onResume() {
    super.onResume()
    val intent = Intent(context, javaClass).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
    val pendingIntent = PendingIntent.getActivity(context, 0, intent, PendingIntent.FLAG_IMMUTABLE )
    NfcAdapter.getDefaultAdapter(context)?.enableForegroundDispatch(this, pendingIntent, null ,null )
  }

  override fun onPause() {
    super.onPause()
    NfcAdapter.getDefaultAdapter(context)?.disableForegroundDispatch(this)
  }
}
