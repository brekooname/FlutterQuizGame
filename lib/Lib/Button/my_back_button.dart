import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'dart:math' as math;

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import '../../main.dart';
import 'my_button.dart';

class MyBackButton extends StatelessWidget {
  final ImageService _imageService = ImageService();
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  late Size buttonSize;
  double buttonAllPadding;

  MyBackButton({Key? key, this.buttonAllPadding = 0}) : super(key: key) {
    var side = _screenDimensions.dimen(12);
    buttonSize = Size(side, side);
  }

  @override
  Widget build(BuildContext context) {
    Widget btn = MyButton(
        buttonAllPadding: buttonAllPadding,
        size: buttonSize,
        onClick: () {
          var currentScreen = MyApp.gameScreenManager.currentScreen;
          currentScreen!.gameScreenManagerState.goBack(currentScreen);
        },
        buttonSkinConfig: ButtonSkinConfig(
          image: (_imageService.getMainImage(
              imageName: MyApp.appId.gameConfig.screenContrast == Contrast.light
                  ? "btn_back_up"
                  : "btn_back_up_white",
              imageExtension: "png",
              module: "buttons",
              maxWidth: buttonSize.width)),
        ),
        fontConfig: FontConfig());

    if (FontConfig.isRtlLanguage) {
      btn = Transform.rotate(
        angle: -math.pi,
        child: btn,
      );
    }

    return btn;
  }
}
