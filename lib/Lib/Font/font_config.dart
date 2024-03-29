import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../main.dart';

class FontConfig {
  static var fontScale = _initFontScale();

  late Color fontColor;

  late Color borderColor;

  late double fontSize;

  late double borderWidth;

  FontWeight? fontWeight;

  FontConfig(
      {Color? fontColor,
      this.borderColor = Colors.transparent,
      double? fontSize,
      double? borderWidth,
      this.fontWeight = FontWeight.w500}) {
    this.fontSize = fontSize ?? normalFontSize;
    this.fontColor = fontColor ?? fontDefaultColor;
    this.borderWidth = borderColor == Colors.transparent
        ? 0
        : borderWidth ?? getStandardBorderWidthBasedOnFontSize(this.fontSize);
  }

  static Color get fontDefaultColor {
    return Colors.black;
  }

  static Color get fontDefaultColorForContrast {
    return MyApp.appId.gameConfig.isLightScreenContrast
        ? Colors.black
        : Colors.white;
  }

  static double getStandardBorderWidthBasedOnFontSize(double fontSize) {
    return standardBorderWidth * (fontSize / normalFontSize);
  }

  static double get standardBorderWidth => _displayDimensionScale / 150;

  static double get standardMinMargin => _displayDimensionScale / 100;

  static double get standardBorderRadius => _displayDimensionScale / 20;

  static double get standardShadowOffset => _displayDimensionScale / 100;

  static double get standardShadowRadius => _displayDimensionScale / 100;

  static double getCustomFontSize(double val) {
    return normalFontSize * val;
  }

  static double get bigFontSize => normalFontSize * 1.5;

  static double get veryBigFontSize => normalFontSize * 2;

  static double get normalFontSize {
    return _displayDimensionScale / fontScale;
  }

  static double get smallFontSize => normalFontSize / 2;

  static double get _displayDimensionScale =>
      ScreenDimensionsService.isPortrait()
          ? MyApp.screenWidth
          : MyApp.screenHeight;

  static bool get isRtlLanguage =>
      [Language.ar.name, Language.he.name].contains(MyApp.languageCode);

  //The larger the value the smaller the fontSize
  static double _initFontScale() {
    String appLang = MyApp.languageCode;
    Map<String, double> fontScaleConfig = {};

    //
    fontScaleConfig.putIfAbsent(Language.ja.name, () => 22);
    fontScaleConfig.putIfAbsent(Language.ko.name, () => 22);
    //
    fontScaleConfig.putIfAbsent(Language.zh.name, () => 21);
    fontScaleConfig.putIfAbsent(Language.th.name, () => 21);
    fontScaleConfig.putIfAbsent(Language.el.name, () => 21);
    fontScaleConfig.putIfAbsent(Language.he.name, () => 21);
    fontScaleConfig.putIfAbsent(Language.hi.name, () => 21);
    fontScaleConfig.putIfAbsent(Language.ar.name, () => 21);
    //
    //
    return fontScaleConfig.getOrDefault(appLang, 18);
  }
}
