import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../Game/Game/campaign_level.dart';
import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Button/my_button.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../Lib/Image/image_service.dart';
import '../../../Lib/ScreenDimensions/screen_dimensions_service.dart';

class AstronomyComponentsService extends QuizGameLocalStorage {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  static final AstronomyComponentsService singleton =
      AstronomyComponentsService.internal();

  factory AstronomyComponentsService() {
    return singleton;
  }

  AstronomyComponentsService.internal();

  Widget createLevelBtn(
      VoidCallback onClick, String btnImageName, String btnText) {
    var horizMargin = _screenDimensions.dimen(8);
    var vertMargin = _screenDimensions.dimen(2);
    return Padding(
        padding: EdgeInsets.only(
            left: horizMargin,
            right: horizMargin,
            top: vertMargin,
            bottom: vertMargin),
        child: MyButton(
          onClick: () {
            onClick.call();
          },
          // buttonAllPadding: _screenDimensions.dimen(10),
          buttonSkinConfig: ButtonSkinConfig(
              image: _imageService.getSpecificImage(
                  maxWidth: _screenDimensions.dimen(20),
                  imageName: btnImageName,
                  imageExtension: "png",
                  module: "buttons"),
              borderRadius: FontConfig.standardBorderRadius * 4),
          size: Size(_screenDimensions.dimen(32), _screenDimensions.dimen(42)),
          fontConfig: FontConfig(fontColor: Colors.black),
          text: btnText,
          textMaxLines: 2,
        ));
  }
}
