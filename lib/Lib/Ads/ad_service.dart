import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/watch_rewarded_ad_popup.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../main.dart';
import '../Popup/buy_pro_popup.dart';
import '../Popup/my_popup.dart';

class AdService {
  bool _isInterstitialAdLoaded = false;
  int _interstitialAdsShown = 0;
  InterstitialAd? _interstitialAd;
  WatchRewardedAdPopup? watchRewardedAdPopup;

  static final AdService singleton = AdService.internal();

  factory AdService() {
    return singleton;
  }

  AdService.internal();

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return MyApp.kIsManualTest
          ? 'ca-app-pub-3940256099942544/6300978111'
          : MyApp.adBannerId;
    } else if (Platform.isIOS) {
      return MyApp.kIsManualTest
          ? 'ca-app-pub-3940256099942544/2934735716'
          : MyApp.adBannerId;
    }
    throw UnsupportedError("Unsupported platform");
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return MyApp.kIsManualTest
          ? 'ca-app-pub-3940256099942544/1033173712'
          : MyApp.adInterstitialId;
    } else if (Platform.isIOS) {
      return MyApp.kIsManualTest
          ? 'ca-app-pub-3940256099942544/4411468910'
          : MyApp.adInterstitialId;
    }
    throw UnsupportedError("Unsupported platform");
  }

  String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return MyApp.kIsManualTest
          ? 'ca-app-pub-3940256099942544/5224354917'
          : MyApp.adRewardedId;
    } else if (Platform.isIOS) {
      return MyApp.kIsManualTest
          ? 'ca-app-pub-3940256099942544/1712485313'
          : MyApp.adRewardedId;
    }
    throw UnsupportedError("Unsupported platform");
  }

  void showInterstitialAd(bool showInterstitialAd,
      {required VoidCallback executeAfterClose}) {
    if (_shouldShowInterstitialAd(showInterstitialAd)) {
      _processInterstitialPopupAd(executeAfterClose);
      _interstitialAdsShown++;
    } else {
      _executeAfterCloseWithInit(executeAfterClose);
    }
  }

  void _processInterstitialPopupAd(VoidCallback executeAfterClose) {
    if (_shouldShowBuyProPopup()) {
      MyPopup.showPopup(BuyProPopup(executeAfterClose));
    } else {
      _showInterstitialAd(executeAfterClose);
    }
  }

  bool _shouldShowInterstitialAd(bool showInterstitialAd) =>
      MyApp.isExtraContentLocked && showInterstitialAd;

  void _showInterstitialAd(VoidCallback executeAfterClose) {
    if (_isInterstitialAdLoaded) {
      _isInterstitialAdLoaded = false;
      _interstitialAd?.show();
      _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (interstitialAd) {
        _executeAfterCloseWithInit(executeAfterClose);
      }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        _executeAfterCloseWithInit(executeAfterClose);
      });
    } else {
      _executeAfterCloseWithInit(executeAfterClose);
    }
  }

  bool _shouldShowBuyProPopup() {
    debugPrint("inter " + _interstitialAdsShown.toString());
    return MyApp.appId.gameConfig.showBuyProPopupAsFirstInterstitial &&
        //Show buyPro every (5 * nrOfQuestionsToShowInterstitialAd) questions => also as the first interstitial
        _interstitialAdsShown % 5 == 0;
  }

  void _executeAfterCloseWithInit(VoidCallback executeAfterClose) {
    executeAfterClose.call();
    initInterstitialAd();
  }

  void initRewardedAd(VoidCallback? onUserEarnedReward) {
    if (onUserEarnedReward != null) {
      if (watchRewardedAdPopup == null) {
        watchRewardedAdPopup =
            WatchRewardedAdPopup(onUserEarnedReward: onUserEarnedReward);
      } else {
        watchRewardedAdPopup!.onUserEarnedReward = onUserEarnedReward;
      }
    }
  }

  BannerAd? initBannerAd() {
    BannerAd? bannerAd;
    if (!kIsWeb && bannerAd == null && MyApp.isExtraContentLocked) {
      bannerAd = BannerAd(
        adUnitId: bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (_) {},
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            debugPrint(
                'Ad load failed (code=${error.code} message=${error.message})');
          },
        ),
      );
      bannerAd.load();
    }
    return bannerAd;
  }

  void initInterstitialAd() {
    if (!kIsWeb && !_isInterstitialAdLoaded && MyApp.isExtraContentLocked) {
      _interstitialAd?.dispose();
      InterstitialAd.load(
          adUnitId: interstitialAdUnitId,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              _interstitialAd = ad;
              _isInterstitialAdLoaded = true;
            },
            onAdFailedToLoad: (LoadAdError error) {
              debugPrint('InterstitialAd failed to load: $error');
            },
          ));
    }
  }
}
