import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

mixin StandardScreen {
  ImageService? _imageService;
  LocalizationService? _localizationService;
  AdService adService = AdService();
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  bool isInterstitialAdLoaded = false;

  void initScreen(MyAppContext myAppContext, BuildContext buildContext) {
    _imageService = ImageService(myAppContext: myAppContext);
    _localizationService = LocalizationService(buildContext: buildContext);
    if (!kIsWeb) {
      initAds(buildContext);
    }
  }

  ImageService get imageService {
    assert(_imageService != null);
    return _imageService!;
  }

  LocalizationService get localizationService {
    assert(_localizationService != null);
    return _localizationService!;
  }

  AppLocalizations get label {
    assert(_localizationService != null);
    return _localizationService!.getAppLocalizations();
  }

  String formatTextWithOneParam(String labelText, String param) {
    return localizationService.formatTextWithParams(labelText, [param]);
  }

  String formatTextWithTwoParams(
      String labelText, String param1, String param2) {
    return localizationService
        .formatTextWithParams(labelText, [param1, param2]);
  }

  void showPopupAd(BuildContext buildContext, VoidCallback goAfterClose) {
    if (interstitialAd != null && isInterstitialAdLoaded) {
      interstitialAd!.show();
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (interstitialAd) {
        goAfterClose.call();
        initInterstitialAd();
      });
    } else {
      goAfterClose.call();
      initInterstitialAd();
    }
  }

  void initAds(BuildContext buildContext) {
    initInterstitialAd();

    bannerAd = BannerAd(
      adUnitId: adService.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );
    bannerAd?.load();
  }

  void initInterstitialAd() {
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

  Color getBackgroundColor() {
    return Colors.red;
  }

  Widget createScreen(Widget mainContent) {
    Container bannerAdContainer;
    if (bannerAd != null) {
      bannerAdContainer = Container(
        child: AdWidget(ad: bannerAd!),
        width: bannerAd?.size.width.toDouble(),
        height: 55.0,
        alignment: Alignment.center,
      );
    } else {
      bannerAdContainer = Container();
    }

    return AspectRatio(
      aspectRatio: 1.777083333333333,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage(imageService.getSpecificImagePath(
              imageName: "background_texture")),
        )),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[bannerAdContainer, Expanded(child: mainContent)],
        ),
      ),
    );
  }
}
