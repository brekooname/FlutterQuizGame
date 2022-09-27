import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Assets/assets_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_size.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

mixin ScreenState {
  final ButtonSize buttonSize = ButtonSize();
  final AssetsService assetsService = AssetsService();
  final AdService adService = AdService();
  final ImageService imageService = ImageService();
  final ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  void initScreenState({VoidCallback? onUserEarnedReward}) {
    adService.initRewardedAd(onUserEarnedReward);
  }
}
