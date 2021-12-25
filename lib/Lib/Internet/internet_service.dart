import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class InternetService {
  Logger logger = Logger(
    printer: PrettyPrinter(),
  );

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

  void openAppUrl(String storeAppId, bool rateApp) async {
    String url = "";

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        url = url + "market://details?id=";
      }
      if (Platform.isIOS) {
        url = url + "itms-apps://itunes.apple.com/xy/app/foo/id";
      }
      url = url + storeAppId;
      if (Platform.isIOS && rateApp) {
        url = url + "?action=write-review";
      }
    }
    logger.d('go to link ' + url);
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
