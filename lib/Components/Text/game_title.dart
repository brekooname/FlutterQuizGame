import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Font/font_config.dart';

import 'my_text.dart';

class GameTitle extends StatelessWidget {
  final default_background_image_width = 240;
  late FontConfig fontConfig;

  late String text;

  late String backgroundImagePath;

  GameTitle(
      {required FontConfig fontConfig,
      required String text,
      required String backgroundImagePath}) {
    this.fontConfig = fontConfig;
    this.text = text;
    this.backgroundImagePath = backgroundImagePath;
  }

  @override
  Widget build(BuildContext context) {
    var defaultText = MyText(
      text: this.text,
      width: default_background_image_width / 1.2,
      fontConfig: this.fontConfig,
    );

    var imageWithText =
        Stack(alignment: AlignmentDirectional.center, children: <Widget>[
      Image.asset(
        backgroundImagePath,
        alignment: Alignment.center,
        width: default_background_image_width.roundToDouble(),
      ),
      defaultText,
    ]);

    return imageWithText;
  }
}
