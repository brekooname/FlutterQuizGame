import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

class ButtonSize {
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

  ButtonSize();

  Size get normalSize => Size(_screenDimensions.w(45), _screenDimensions.h(9));
}
