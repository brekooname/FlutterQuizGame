import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

mixin ScreenState {
  MyAudioPlayer audioPlayer = MyAudioPlayer();
  ButtonSize buttonSize = ButtonSize();
  AssetsService assetsService = AssetsService();
  AdService adService = AdService();
  ImageService imageService = ImageService();
  LocalizationService _localizationService = LocalizationService();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  void initScreen({VoidCallback? onUserEarnedReward}) {
    adService.initRewardedAd(onUserEarnedReward);
  }

  AppLocalizations get label => MyApp.appLocalizations;

  String formatTextWithOneParam(String labelText, Object param) {
    return _localizationService
        .formatTextWithParams(labelText, [param.toString()]);
  }

  String formatTextWithTwoParams(
      String labelText, String param1, String param2) {
    return _localizationService
        .formatTextWithParams(labelText, [param1, param2]);
  }

  void goBack(StandardScreen standardScreen){
    standardScreen.gameScreenManagerState.goBack(standardScreen);
  }

}
