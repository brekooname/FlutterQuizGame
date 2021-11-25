import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';

class ButtonSkinConfig {
  RadialGradient? backgroundGradient;

  Image? icon;

  Color? borderColor;

  late double borderWidth;

  ButtonSkinConfig(
      {Color? backgroundColor,
      Image? icon,
      Color borderColor = Colors.transparent,
      double borderWidth = 0}) {
    if (backgroundColor != null) {
      this.backgroundGradient = RadialGradient(radius: 4, colors: [
        ColorUtil.colorDarken(backgroundColor, -0.05),
        backgroundColor,
      ]);
    } else {
      this.icon = icon;
    }
    this.borderColor = borderColor;
    this.borderWidth =
        borderColor == Colors.transparent ? 0 : getStandardBorderWidth();
  }

  static double getStandardBorderWidth() {
    return 5;
  }
}
