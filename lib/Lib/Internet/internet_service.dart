import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class InternetService {
  static final InternetService singleton = InternetService.internal();

  factory InternetService() {
    return singleton;
  }

  InternetService.internal();

  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        return true;
      }
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on Exception catch (_) {
      return false;
    }
  }
}
