import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/watch_rewarded_ad_popup.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../main.dart';

class AdService {
  //
  //////
  ////////////
  //TODO ---VALUE CHANGED--- should be false
  static const bool isTest = false;

  ////////////
  //////
  //

  bool isInterstitialAdLoaded = false;
  InterstitialAd? interstitialAd;
  WatchRewardedAdPopup? watchRewardedAdPopup;

  static final AdService singleton = AdService.internal();

  factory AdService() {
    return singleton;
  }

  AdService.internal();

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return isTest
          ? 'ca-app-pub-3940256099942544/6300978111'
          : MyApp.adBannerId;
    } else if (Platform.isIOS) {
      return isTest
          ? 'ca-app-pub-3940256099942544/2934735716'
          : MyApp.adBannerId;
    }
    throw UnsupportedError("Unsupported platform");
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return isTest
          ? 'ca-app-pub-3940256099942544/1033173712'
          : MyApp.adInterstitialId;
    } else if (Platform.isIOS) {
      return isTest
          ? 'ca-app-pub-3940256099942544/4411468910'
          : MyApp.adInterstitialId;
    }
    throw UnsupportedError("Unsupported platform");
  }

  String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return isTest
          ? 'ca-app-pub-3940256099942544/5224354917'
          : MyApp.adRewardedId;
    } else if (Platform.isIOS) {
      return isTest
          ? 'ca-app-pub-3940256099942544/1712485313'
          : MyApp.adRewardedId;
    }
    throw UnsupportedError("Unsupported platform");
  }

  void showInterstitialAd(BuildContext buildContext, bool showInterstitialAd,
      VoidCallback executeAfterClose) {
    if (MyApp.isExtraContentLocked &&
        isInterstitialAdLoaded &&
        showInterstitialAd) {
      isInterstitialAdLoaded = false;
      interstitialAd?.show();
      interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (interstitialAd) {
        executeAfterClose.call();
        initInterstitialAd();
      }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        executeAfterClose.call();
        initInterstitialAd();
      });
    } else {
      executeAfterClose.call();
      initInterstitialAd();
    }
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
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (_) {},
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print(
                'Ad load failed (code=${error.code} message=${error.message})');
          },
        ),
      );
      bannerAd.load();
    }
    return bannerAd;
  }

  void initInterstitialAd() {
    if (!kIsWeb && !isInterstitialAdLoaded && MyApp.isExtraContentLocked) {
      interstitialAd?.dispose();
      InterstitialAd.load(
          adUnitId: interstitialAdUnitId,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              interstitialAd = ad;
              isInterstitialAdLoaded = true;
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error');
            },
          ));
    }
  }
}
