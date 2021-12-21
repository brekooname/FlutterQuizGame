import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import 'my_text.dart';

class GameTitle extends StatelessWidget {
  late double backgroundImageWidth;
  late FontConfig fontConfig;

  late String text;

  late String backgroundImagePath;

  GameTitle({
    required FontConfig fontConfig,
    required String text,
    required String backgroundImagePath,
    double? backgroundImageWidth,
  }) {
    this.fontConfig = fontConfig;
    this.text = text;
    this.backgroundImagePath = backgroundImagePath;
    this.backgroundImageWidth =
        backgroundImageWidth ?? ScreenDimensionsService().w(85);
  }

  @override
  Widget build(BuildContext context) {
    var imageWithText =
        Stack(alignment: AlignmentDirectional.center, children: <Widget>[
      Image.asset(
        backgroundImagePath,
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
        width: backgroundImageWidth,
      ),
      MyText(
        text: this.text,
        width: backgroundImageWidth / 1.4,
        maxLines: this.text.contains(" ") ? 2 : 1,
        fontConfig: this.fontConfig,
      ),
    ]);

    return imageWithText;
  }
}
