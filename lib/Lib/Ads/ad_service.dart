import 'dart:io';

import '../../main.dart';

class AdService {
  static final AdService singleton = AdService.internal();

  factory AdService() {
    return singleton;
  }

  AdService.internal();

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return MyApp.adBannerId;
      // return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return MyApp.adBannerId;
      // return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return MyApp.adInterstitialId;
      // return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      return MyApp.adInterstitialId;
      // return 'ca-app-pub-3940256099942544/4411468910';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return MyApp.adRewardedId;
      // return 'ca-app-pub-3940256099942544/5224354917';
    } else if (Platform.isIOS) {
      return MyApp.adRewardedId;
      // return 'ca-app-pub-3940256099942544/1712485313';
    }
    throw new UnsupportedError("Unsupported platform");
  }
}
