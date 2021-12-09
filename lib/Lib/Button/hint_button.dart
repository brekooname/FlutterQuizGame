import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/watch_rewarded_ad_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class HintButton extends StatelessWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  late Size buttonSize;
  VoidCallback onClick;
  bool disabled;
  bool showAvailableHintsText;
  bool watchRewardedAdForHint;
  int availableHints;

  HintButton(
      {Size? buttonSize,
      this.availableHints = 1,
      required this.onClick,
      this.disabled = false,
      this.watchRewardedAdForHint = false,
      this.showAvailableHintsText = false}) {
    var side = screenDimensions.w(14);
    this.buttonSize = buttonSize ?? Size(side, side);
  }

  @override
  Widget build(BuildContext context) {
    var shouldShowRewardedAd = availableHints <= 0 && watchRewardedAdForHint;
    var icon = ImageService().getMainImage(
        imageName: shouldShowRewardedAd ? "btn_hint_ad" : "btn_hint",
        module: "buttons",
        maxWidth: buttonSize.width);

    if (availableHints <= 0 && !watchRewardedAdForHint) {
      this.disabled = true;
    }

    var btn = MyButton(
        size: buttonSize,
        disabled: disabled,
        onClick: shouldShowRewardedAd
            ? () {
                Future.delayed(
                    Duration.zero,
                    () => showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return buildWatchRewardedAdPopup(context);
                        }));
              }
            : onClick,
        buttonSkinConfig: ButtonSkinConfig(image: icon),
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

    return this.showAvailableHintsText && !shouldShowRewardedAd
        ? Stack(
            children: [fittedBtn, createHintAmountText()],
          )
        : fittedBtn;
  }

  Widget buildWatchRewardedAdPopup(BuildContext context) {
    return WatchRewardedAdPopup(onUserEarnedReward: this.onClick);
  }

  Container createHintAmountText() {
    return Container(
        width: buttonSize.width,
        height: buttonSize.height,
        child: MyText(
          alignmentInsideContainer: Alignment.bottomRight,
          text: availableHints.toString(),
          fontConfig: FontConfig(
              fontSize: FontConfig.getNormalFontSize(),
              textColor: Colors.lightGreenAccent,
              borderWidth: FontConfig.getStandardBorderWidth() * 1.2,
              borderColor: Colors.black),
        ));
  }
}
