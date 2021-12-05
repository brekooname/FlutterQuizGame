import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class MyBackButton extends StatelessWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  late Size button_size;

  late VoidCallback onClick;

  MyBackButton({VoidCallback? onClick, required BuildContext context}) {
    var side = screenDimensions.w(12);
    button_size = Size(side, side);
    this.onClick = onClick ??
        () {
          Navigator.pop(context);
        };
  }

  @override
  Widget build(BuildContext context) {
    var btn = MyButton(
        size: button_size,
        onClick: onClick,
        buttonSkinConfig: ButtonSkinConfig(
            icon: Image.asset(
          MyAppContext.contrast == Contrast.LIGHT
              ? "assets/main/buttons/btn_back_up.png"
              : "assets/main/buttons/btn_back_up_white.png",
          alignment: Alignment.center,
          width: button_size.width,
        )),
        fontConfig: FontConfig());

    return btn;
  }
}
