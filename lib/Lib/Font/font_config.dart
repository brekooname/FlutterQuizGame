import 'package:flutter/material.dart';

import '../../main.dart';
import 'font_util.dart';

class FontConfig {
  late Color textColor;

  late Color borderColor;

  late double fontSize;

  late double borderWidth;

  FontWeight? fontWeight;

  FontConfig(
      {Color? textColor,
      this.borderColor = Colors.transparent,
      double? fontSize,
      double? borderWidth,
      this.fontWeight = FontWeight.bold}) {
    this.fontSize = fontSize == null ? getNormalFontSize() : fontSize;
    this.textColor =
        textColor == null ? FontUtil.getFontDefaultColor() : textColor;
    this.borderWidth = borderColor == Colors.transparent
        ? 0
        : borderWidth ?? getStandardBorderWidthBasedOnFontSize(this.fontSize);
  }

  static double getStandardBorderWidthBasedOnFontSize(double fontSize) {
    return getStandardBorderWidth() * (fontSize / getNormalFontSize());
  }

  static double getStandardBorderWidth() {
    return getDisplayDimensionScale() / 400;
  }

  static double getStandardBorderRadius() {
    return getDisplayDimensionScale() / 45;
  }

  static double getStandardShadowOffset() {
    return getDisplayDimensionScale() / 260;
  }

  static double getCustomFontSize(double val) {
    return getNormalFontSize() * val;
  }

  static double getBigFontSize() {
    return getNormalFontSize() * 1.5;
  }

  static double getVeryBigFontSize() {
    return getNormalFontSize() * 2;
  }

  static double getNormalFontSize() {
    return getDisplayDimensionScale() / 55;
  }

  static double getSmallFontSize() {
    return getNormalFontSize() / 2;
  }

  static double getDisplayDimensionScale() =>
      (MyAppState.screenWidth + MyAppState.screenHeight);
}
