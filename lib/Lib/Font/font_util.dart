import 'package:flutter/material.dart';

import '../../main.dart';

class FontUtil {
  static Color getFontDefaultColor() {
    return Colors.black;
  }

  static Color getFontDefaultColorForContrast() {
    return MyApp.appId.gameConfig.isLightScreenContrast
        ? Colors.black
        : Colors.white;
  }
}
