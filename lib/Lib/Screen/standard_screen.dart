import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

mixin StandardScreen {
  bool isBannerAdLoaded = false;
  ImageService? _imageService;
  LocalizationService? _localizationService;
  AdService adService = AdService();
  late BannerAd bannerAd;

  void initScreen(
      MyAppContext myAppContext, BuildContext buildContext, BannerAd bannerAd) {
    _imageService = ImageService(myAppContext: myAppContext);
    _localizationService = LocalizationService(buildContext: buildContext);
    this.bannerAd = bannerAd;
    this.bannerAd.load();
  }

  ImageService get imageService {
    assert(_imageService != null);
    return _imageService!;
  }

  AppLocalizations get label {
    assert(_localizationService != null);
    return _localizationService!.getAppLocalizations();
  }

  String getLabelTextWithParam(String labelText, String param) {
    return _getLabelTextWithParams(labelText, [param]);
  }

  String getLabelTextWithTwoParams(
      String labelText, String param1, String param2) {
    return _getLabelTextWithParams(labelText, [param1, param2]);
  }

  String _getLabelTextWithParams(String labelText, List<String> args) {
    for (int i = 0; i < args.length; ++i) {
      labelText = labelText.replaceAll("{$i}", args[i]);
    }
    return labelText;
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
        child: Column(children: <Widget>[bannerAdContainer, widget],),
      ),
    );
  }
}
