

import 'package:bookpal/core/injection_container.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class Utilities {
  static String getIdentifierName(dynamic identifier) {
    if (identifier is String) {
      return 'email';
    }
    return 'id';
  }

  static String getBookIdentifierName(dynamic identifier) {
    if (identifier is String) {
      return 'barcode';
    }
    return 'id';
  }

  static String? toISO8601String(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${dateTime.toIso8601String()}Z";
  }

  static DateTime fromISO8601String(String dateTime) {
    return DateTime.parse(dateTime);
  }

  static DateTime? fromISO8601StringNullable(String? dateTime) {
    if (dateTime == null) return null;
    return DateTime.parse(dateTime);
  }

  static Future<String> getAuthorization() async {
    return "Bearer ${await getIt.get<SessionManager>().get("jwt")}";
  }
}