import 'package:flutter/material.dart';


import '../../Lib/Constants/contrast.dart';
import '../../main.dart';

class FontUtil {

  static Color getFontDefaultColor() {
    return getFontDefaultColorForContrast(MyApp.appId.gameConfig.screenContrast);
  }

  static Color getFontDefaultColorForContrast(Contrast contrast) {
    return getFontDefaultColorForContrastWithColors(
        contrast, Colors.white, Colors.black);
  }

  static Color getFontDefaultColorForContrastWithColors(
      Contrast contrast, Color darkContrastStyle, Color lightContrastStyle) {
    return contrast == Contrast.light ? lightContrastStyle : darkContrastStyle;
  }
}
