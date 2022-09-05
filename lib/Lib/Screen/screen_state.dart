import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

mixin ScreenState {
  ButtonSize buttonSize = ButtonSize();
  AssetsService assetsService = AssetsService();
  AdService adService = AdService();
  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  void initScreenState({VoidCallback? onUserEarnedReward}) {
    adService.initRewardedAd(onUserEarnedReward);
  }

  void goBack(StandardScreen standardScreen){
    standardScreen.gameScreenManagerState.goBack(standardScreen);
  }

  void refreshScreen(State state){
    state.setState(() {
    });
  }

}
