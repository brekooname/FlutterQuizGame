import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

mixin StandardScreen {
  late BannerAd bannerAd;
  ImageService? _imageService;
  LocalizationService? _localizationService;
  AdService adService = AdService();
  InterstitialAd? interstitialAd;

  void initScreen(MyAppContext myAppContext, BuildContext buildContext) {
    _imageService = ImageService(myAppContext: myAppContext);
    _localizationService = LocalizationService(buildContext: buildContext);
    initAds(buildContext);
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

  String getLabelTextWithParam(String labelText, String param) {
    return localizationService.getLabelTextWithParams(labelText, [param]);
  }

  String getLabelTextWithTwoParams(
      String labelText, String param1, String param2) {
    return localizationService
        .getLabelTextWithParams(labelText, [param1, param2]);
  }

  void showPopupAd(BuildContext buildContext, VoidCallback goAfterClose) {
    if (interstitialAd != null) {
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
    bannerAd.load();
  }

  void initInterstitialAd() {
    interstitialAd?.dispose();
    InterstitialAd.load(
        adUnitId: adService.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  Color getBackgroundColor() {
    return Colors.red;
  }

  Widget createScreen(Widget widget) {
    var bannerAdContainer = Container(
      child: AdWidget(ad: bannerAd),
      width: bannerAd.size.width.toDouble(),
      height: 75.0,
      alignment: Alignment.center,
    );

    return AspectRatio(
      aspectRatio: 1.777083333333333,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage(imageService.getImagePath("background_texture")),
        )),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[bannerAdContainer, widget],
        ),
      ),
    );
  }
}
