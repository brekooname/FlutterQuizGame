import 'package:flutter/material.dart';

import 'font_util.dart';

class FontConfig {
  late Color textColor;

  late Color borderColor;

  late int fontSize;

  late int borderWidth;

  FontWeight? fontWeight;

  FontConfig(
      {Color? textColor,
      this.borderColor = Colors.transparent,
      int? fontSize,
      int? borderWidth,
      this.fontWeight = FontWeight.bold}) {
    this.fontSize = fontSize == null ? getNormalFontSize() : fontSize;
    this.textColor = textColor == null ? FontUtil.getFontDefaultColor() : textColor;
    this.borderWidth = borderColor == Colors.transparent
        ? 0
        : borderWidth == null
            ? getStandardBorderWidth()
            : borderWidth;
  }

  static int getStandardBorderWidth() {
    return 3;
  }

  static int getBigFontSize() {
    return (getNormalFontSize() * 1.5).round();
  }

  static int getNormalFontSize() {
    return 20;
  }

  static int getSmallFontSize() {
    return (getNormalFontSize() / 2).round();
  }
}
