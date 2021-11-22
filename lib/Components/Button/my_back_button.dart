import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Constants/contrast.dart';
import 'package:flutter_app_quiz_game/Game/game.dart';

import '../../Components/Button/button_skin_config.dart';
import '../../Components/Font/font_config.dart';
import 'my_button.dart';

class MyBackButton extends StatelessWidget {
  Size button_size = Size(50, 50);

  @override
  Widget build(BuildContext context) {
    var btn = MyButton(
        width: button_size.width,
        height: button_size.height,
        onClick: () {},
        buttonSkinConfig: ButtonSkinConfig(
            icon: Image.asset(
          Game.contrast == Contrast.LIGHT
              ? "assets/main/buttons/btn_back_up.png"
              : "assets/main/buttons/btn_back_up_white.png",
          alignment: Alignment.center,
          width: button_size.width,
        )),
        fontConfig: FontConfig());

    return btn;
  }
}
