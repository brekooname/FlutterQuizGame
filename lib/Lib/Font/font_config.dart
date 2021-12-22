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
    this.fontSize = fontSize == null ? normalFontSize : fontSize;
    this.textColor =
        textColor == null ? FontUtil.getFontDefaultColor() : textColor;
    this.borderWidth = borderColor == Colors.transparent
        ? 0
        : borderWidth ?? getStandardBorderWidthBasedOnFontSize(this.fontSize);
  }

  static double getStandardBorderWidthBasedOnFontSize(double fontSize) {
    return standardBorderWidth * (fontSize / normalFontSize);
  }

  static double get standardBorderWidth => displayDimensionScale / 150;

  static double get standardBorderRadius => displayDimensionScale / 20;

  static double get standardShadowOffset => displayDimensionScale / 100;

  static double get standardShadowRadius => displayDimensionScale / 100;

  static double getCustomFontSize(double val) {
    return normalFontSize * val;
  }

  static double get bigFontSize => normalFontSize * 1.5;

  static double get veryBigFontSize => normalFontSize * 2;

  static double get normalFontSize => displayDimensionScale / 18;

  static double get smallFontSize => normalFontSize / 2;

  static double get displayDimensionScale => MyApp.screenWidth;
}
