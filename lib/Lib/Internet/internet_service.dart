import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void openAppUrl(String storeAppId, bool rateApp, BuildContext context) async {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        String url = "market://details?id=" + storeAppId;
        var uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      }

      if (Platform.isIOS) {
        try {
          int version =
              Platform.operatingSystemVersion.split(".")[0].parseToInt;
          String url;
          if (version < 7) {
            url =
                "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" +
                    storeAppId;
          } else if (version == 7) {
            url = "itms-apps://itunes.apple.com/app/id" + storeAppId;
          } else {
            url = "itms-apps://itunes.apple.com/xy/app/foo/id" +
                storeAppId +
                (rateApp ? "?action=write-review" : "");
          }
          await launchUrl(Uri.parse(url));
        } on Exception {
          return;
        } catch (error) {
          return;
        }
      }
    }
  }
}
