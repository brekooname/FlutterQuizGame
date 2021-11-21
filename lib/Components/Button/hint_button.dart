import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Components/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Components/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Components/Game/game.dart';
import 'package:flutter_app_quiz_game/Components/Text/my_text.dart';
import 'package:flutter_app_quiz_game/Constants/contrast.dart';

import '../../Components/Button/button_skin_config.dart';
import '../../Components/Font/font_config.dart';
import 'my_button.dart';

class HintButton extends StatelessWidget {
  double btnSideSize = 60;
  late Size buttonSize;

  bool disabled;
  int availableHints;

  HintButton(
      {Size? buttonSize, this.availableHints = 1, this.disabled = false}) {
    this.buttonSize =
        buttonSize == null ? Size(btnSideSize, btnSideSize) : buttonSize;
  }

  @override
  Widget build(BuildContext context) {
    var btn = MyButton(
        width: buttonSize.width,
        height: buttonSize.height,
        disabled: disabled,
        onClick: () {},
        buttonSkinConfig: ButtonSkinConfig(
            icon: Image.asset(
          "assets/main/buttons/btn_hint.png",
          alignment: Alignment.center,
          width: buttonSize.width,
        )),
        fontConfig: FontConfig());

    var fittedBtn = SizedBox(
        width: buttonSize.width,
        height: buttonSize.height,
        child: disabled
            ? btn
            : AnimateZoomInZoomOut(
                toAnimateWidgetSize: buttonSize,
                toAnimateWidget: btn,
              ));

    return this.availableHints > 1
        ? Stack(
            children: [
              fittedBtn,
              Container(
                  width: buttonSize.width,
                  height: buttonSize.height,
                  child: MyText(
                    alignmentInsideContainer: Alignment.bottomRight,
                    text: availableHints.toString(),
                    fontConfig: FontConfig(
                        fontSize: FontConfig.getBigFontSize(),
                        textColor: Colors.lightGreenAccent,
                        borderWidth: FontConfig.getStandardBorderWidth() * 2,
                        borderColor: Colors.black),
                  ))
            ],
          )
        : fittedBtn;
  }
}
