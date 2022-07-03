import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';

class ButtonSkinConfig {
  late double borderRadius;
  late Color borderColor;
  Gradient? backgroundGradient;
  Widget? _image;
  Icon? _icon;
  bool withBorder;
  Color? buttonPressedShadowColor;
  Color? buttonUnpressedShadowColor;

  late double borderWidth;

  ButtonSkinConfig(
      {Color? backgroundColor,
      Gradient? backgroundGradient,
      Widget? image,
      Icon? icon,
      Color? borderColor,
      double? borderRadius,
      double borderWidth = 0,
      this.withBorder = true,
      this.buttonPressedShadowColor,
      this.buttonUnpressedShadowColor}) {
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
    this.borderRadius = borderRadius ?? FontConfig.standardBorderRadius;
  }

  Widget? get image {
    return _image ?? _icon;
  }
}
