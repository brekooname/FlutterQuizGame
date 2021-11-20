import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Color/color_util.dart';

class ButtonSkinConfig {
  RadialGradient? backgroundGradient;

  late Color borderColor;

  late double borderWidth;

  ButtonSkinConfig(
      {required Color backgroundColor,
      Color borderColor = Colors.transparent,
      double borderWidth = 0}) {
    this.backgroundGradient = RadialGradient(radius: 4, colors: [
      ColorUtil.darken(backgroundColor, 0.2),
      backgroundColor,
    ]);
    this.borderColor = borderColor;
    this.borderWidth =
        borderColor == Colors.transparent ? 0 : getStandardBorderWidth();
  }

  static double getStandardBorderWidth() {
    return 5;
  }
}
