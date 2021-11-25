import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';

import '../../Lib/Constants/contrast.dart';

class FontUtil {

  static Color getFontDefaultColor() {
    return getFontDefaultColorForContrast(MyAppContext.contrast);
  }

  static Color getFontDefaultColorForContrast(Contrast contrast) {
    return getFontDefaultColorForContrastWithColors(
        contrast, Colors.white, Colors.black);
  }

  static Color getFontDefaultColorForContrastWithColors(
      Contrast contrast, Color darkContrastStyle, Color lightContrastStyle) {
    return contrast == Contrast.LIGHT ? lightContrastStyle : darkContrastStyle;
  }
}
