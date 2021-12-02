import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class HintButton extends StatelessWidget {
  double btnSideSize = 60;
  late Size buttonSize;
  VoidCallback onClick;
  bool disabled;
  bool showAvailableHintsText;
  int availableHints;

  HintButton(
      {Size? buttonSize,
      this.availableHints = 1,
      required this.onClick,
      this.disabled = false,
      this.showAvailableHintsText = false}) {
    this.buttonSize = buttonSize ?? Size(btnSideSize, btnSideSize);
  }

  @override
  Widget build(BuildContext context) {
    var icon = ImageService().getMainImage(
        imageName: "btn_hint", module: "buttons", maxWidth: buttonSize.width);

    var btn = MyButton(
        size: buttonSize,
        disabled: disabled,
        onClick: onClick,
        buttonSkinConfig: ButtonSkinConfig(icon: icon),
        fontConfig: FontConfig());

    if (availableHints == 0) {
      this.disabled = true;
    }

    var fittedBtn = SizedBox(
        width: buttonSize.width,
        height: buttonSize.height,
        child: disabled
            ? btn
            : AnimateZoomInZoomOut(
                toAnimateWidgetSize: buttonSize,
                toAnimateWidget: btn,
              ));

    return this.showAvailableHintsText
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
