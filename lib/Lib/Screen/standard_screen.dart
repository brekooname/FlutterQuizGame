import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/watch_rewarded_ad_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../main.dart';

mixin StandardScreen {
  MyAudioPlayer audioPlayer = MyAudioPlayer();
  ButtonSize buttonSize = ButtonSize();
  AssetsService assetsService = AssetsService();
  ImageService imageService = ImageService();
  LocalizationService localizationService = LocalizationService();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  AdService adService = AdService();
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  WatchRewardedAdPopup? watchRewardedAdPopup;
  VoidCallback? onUserEarnedReward;
  bool isInterstitialAdLoaded = false;
  bool screenInitialized = false;

  void initScreen(BuildContext buildContext,
      {VoidCallback? onUserEarnedReward}) {
    if (!screenInitialized) {
      screenInitialized = true;
      this.onUserEarnedReward = onUserEarnedReward;
      initAds(buildContext);
    }
  }

  void disposeScreen() {
    bannerAd?.dispose();
    interstitialAd?.dispose();
  }

  AppLocalizations get label => MyApp.appLocalizations;

  String formatTextWithOneParam(String labelText, Object param) {
    return localizationService
        .formatTextWithParams(labelText, [param.toString()]);
  }

  String formatTextWithTwoParams(
      String labelText, String param1, String param2) {
    return localizationService
        .formatTextWithParams(labelText, [param1, param2]);
  }

  void showInterstitialAd(BuildContext buildContext, bool showPopupAd,
      VoidCallback executeAfterClose) {
    if (showPopupAd &&
        MyApp.isExtraContentLocked &&
        interstitialAd != null &&
        isInterstitialAdLoaded) {
      interstitialAd!.show();
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
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

  void initAds(BuildContext buildContext) {
    initInterstitialAd();
    if (onUserEarnedReward != null) {
      watchRewardedAdPopup =
          WatchRewardedAdPopup(onUserEarnedReward: onUserEarnedReward!);
    }
    if (!kIsWeb && MyApp.isExtraContentLocked) {
      bannerAd = BannerAd(
        adUnitId: adService.bannerAdUnitId,
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
      bannerAd?.load();
    }
  }

  void initInterstitialAd() {
    if (!kIsWeb && MyApp.isExtraContentLocked) {
      interstitialAd?.dispose();
      isInterstitialAdLoaded = false;
      InterstitialAd.load(
          adUnitId: adService.interstitialAdUnitId,
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

  Color getBackgroundColor() {
    return Colors.red;
  }

  Widget createScreen(Widget mainContent) {
    Container bannerAdContainer;
    if (kIsWeb && MyApp.isExtraContentLocked) {
      bannerAdContainer = Container(
        color: Colors.red,
        width: bannerAd?.size.width.toDouble(),
        height: bannerAd?.size.height.toDouble(),
        alignment: Alignment.center,
      );
    } else if (bannerAd != null && MyApp.isExtraContentLocked) {
      bannerAdContainer = Container(
        child: AdWidget(ad: bannerAd!),
        width: bannerAd?.size.width.toDouble(),
        height: bannerAd?.size.height.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      bannerAdContainer = Container();
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        repeat: ImageRepeat.repeat,
        image: AssetImage(assetsService.getSpecificAssetPath(
            assetExtension: "png", assetName: "background_texture")),
      )),
      alignment: Alignment.center,
      width: double.infinity,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[bannerAdContainer, Expanded(child: mainContent)],
          ),
        ),
      ),
    );
  }
}
