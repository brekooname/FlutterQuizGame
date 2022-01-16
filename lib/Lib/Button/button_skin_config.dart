import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';

class ButtonSkinConfig {
  Gradient? backgroundGradient;
  Image? _image;
  Icon? _icon;
  Color? borderColor;
  bool withBorder;

  late double borderWidth;

  ButtonSkinConfig(
      {Color? backgroundColor,
      Gradient? backgroundGradient,
      Image? image,
      Icon? icon,
      Color? borderColor,
      double borderWidth = 0,
      this.withBorder = true}) {
    if (backgroundGradient != null) {
      this.backgroundGradient = backgroundGradient;
      backgroundColor = backgroundGradient.colors.first;
    } else if (backgroundColor != null) {
      this.backgroundGradient = RadialGradient(radius: 4, colors: [
        ColorUtil.colorDarken(backgroundColor, -0.05),
        backgroundColor,
      ]);
    } else {
      withBorder = false;
      _image = image;
      _icon = icon;
    }
    this.borderColor = withBorder
        ? borderColor ?? ColorUtil.colorDarken(backgroundColor!, -0.15)
        : Colors.transparent;
    this.borderWidth =
        borderColor == Colors.transparent ? 0 : FontConfig.standardBorderWidth;
  }

  Widget? get image {
    return _image ?? _icon;
  }
}
