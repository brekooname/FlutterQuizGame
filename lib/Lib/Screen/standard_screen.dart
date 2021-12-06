import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

mixin StandardScreen {
  late MyAppContext myAppContext;
  ImageService imageService = ImageService();
  LocalizationService? _localizationService;
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  AdService adService = AdService();
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  bool isInterstitialAdLoaded = false;
  RewardedAd? rewardedAd;
  bool isRewardedAdLoaded = false;
  VoidCallback? onRewardedAdLoadedSetState;

  void initScreen(MyAppContext myAppContext, BuildContext buildContext,
      {VoidCallback? onRewardedAdLoadedSetState}) {
    this.myAppContext = myAppContext;
    this.onRewardedAdLoadedSetState = onRewardedAdLoadedSetState;
    _localizationService = LocalizationService(buildContext: buildContext);
    if (!kIsWeb) {
      initAds(buildContext);
    }
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

  void showPopupAd(BuildContext buildContext, VoidCallback executeAfterClose) {
    if (interstitialAd != null && isInterstitialAdLoaded) {
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

  void showRewardedAd(
      BuildContext buildContext, VoidCallback executeAfterClose) {
    if (rewardedAd != null && isRewardedAdLoaded) {
      rewardedAd!.show(
          onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
        executeAfterClose.call();
        initRewardedAd();
      });
      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (interstitialAd) {
        initRewardedAd();
      }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        initRewardedAd();
      });
    } else {
      initRewardedAd();
    }
  }

  void initAds(BuildContext buildContext) {
    initInterstitialAd();
    initRewardedAd();

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

  void initRewardedAd() {
    if (onRewardedAdLoadedSetState != null) {
      rewardedAd?.dispose();
      isRewardedAdLoaded = false;
      print("9999999999999999999999999999999999999999ISREWARDEDADLOADED" + isRewardedAdLoaded.toString());
      RewardedAd.load(
          adUnitId: adService.rewardedAdUnitId,
          request: AdRequest(),
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad) {
              this.rewardedAd = ad;
              print("55555555555555555555555555555ISREWARDEDADLOADED" + isRewardedAdLoaded.toString());
              onRewardedAdLoadedSetState?.call();
            },
            onAdFailedToLoad: (LoadAdError error) {
              print("55555555555555555555555555555xxxxxxxxxxxxxxxxxx" + isRewardedAdLoaded.toString());
              print('RewardedAd failed to load: $error');
            },
          ));
    }
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

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        repeat: ImageRepeat.repeat,
        image: AssetImage(imageService.getSpecificImagePath(
            appKey: myAppContext.appId.appKey,
            imageName: "background_texture")),
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
