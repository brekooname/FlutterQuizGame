import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import 'my_text.dart';

class GameTitle extends StatelessWidget {
  late double backgroundImageWidth;
  FontConfig fontConfig;
  String text;
  String? backgroundImagePath;
  double? backgroundImageOpacity;
  Shadow? textShadow;
  double? textWidth;

  GameTitle({
    Key? key,
    required this.fontConfig,
    required this.text,
    this.textShadow,
    this.backgroundImagePath,
    this.backgroundImageOpacity,
    double? backgroundImageWidth,
    double? textWidth,
  }) : super(key: key) {
    this.backgroundImageWidth =
        backgroundImageWidth ?? ScreenDimensionsService().w(95);
    this.textWidth = textWidth ?? (this.backgroundImageWidth / 1.2);
  }

  @override
  Widget build(BuildContext context) {
    var imageWithText =
        Stack(alignment: AlignmentDirectional.center, children: <Widget>[
      backgroundImagePath != null
          ? Opacity(
              opacity: backgroundImageOpacity ?? 1,
              child: Image.asset(
                backgroundImagePath!,
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                width: backgroundImageWidth,
              ))
          : const SizedBox(),
      MyText(
        text: text,
        textShadow: textShadow,
        width: textWidth,
        maxLines: text.contains(" ") ? 2 : 1,
        fontConfig: fontConfig,
      ),
    ]);

    return imageWithText;
  }
}
