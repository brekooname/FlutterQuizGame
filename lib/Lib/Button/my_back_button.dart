import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class MyBackButton extends StatelessWidget {
  ImageService _imageService = ImageService();
  ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  late Size _button_size;

  late VoidCallback onClick;

  MyBackButton({VoidCallback? onClick, required BuildContext context}) {
    var side = _screenDimensions.w(12);
    _button_size = Size(side, side);
    this.onClick = onClick ??
        () {
          Navigator.pop(context);
        };
  }

  @override
  Widget build(BuildContext context) {
    var btn = MyButton(
        size: _button_size,
        onClick: onClick,
        buttonSkinConfig: ButtonSkinConfig(
          icon: (_imageService.getMainImage(
              imageName: MyAppContext.contrast == Contrast.LIGHT
                  ? "btn_back_up"
                  : "btn_back_up_white",
              module: "buttons",
              maxWidth: _button_size.width)),
        ),
        fontConfig: FontConfig());

    return btn;
  }
}
