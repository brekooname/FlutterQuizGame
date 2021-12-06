import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class HintButton extends StatelessWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  late Size buttonSize;
  VoidCallback onClick;
  VoidCallback? onWatchRewardedAdReward;
  bool disabled;
  bool showAvailableHintsText;
  bool isRewardedAdLoaded;
  bool watchRewardedAdForHint;
  int availableHints;

  HintButton(
      {Size? buttonSize,
      this.availableHints = 1,
      required this.onClick,
      this.disabled = false,
      this.onWatchRewardedAdReward,
      this.watchRewardedAdForHint = false,
      this.isRewardedAdLoaded = false,
      this.showAvailableHintsText = false}) {
    var side = screenDimensions.w(14);
    this.buttonSize = buttonSize ?? Size(side, side);
    if (watchRewardedAdForHint) {
      assert(onWatchRewardedAdReward != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    var shouldShowRewardedAd = availableHints <= 0 && watchRewardedAdForHint;
    var icon = ImageService().getMainImage(
        imageName: shouldShowRewardedAd && isRewardedAdLoaded
            ? "btn_hint_ad"
            : "btn_hint",
        module: "buttons",
        maxWidth: buttonSize.width);

    if (availableHints <= 0 && !watchRewardedAdForHint) {
      this.disabled = true;
    }

    if (shouldShowRewardedAd && !isRewardedAdLoaded) {
      this.disabled = true;
    }

    var btn = MyButton(
        size: buttonSize,
        disabled: disabled,
        onClick: shouldShowRewardedAd ? onWatchRewardedAdReward : onClick,
        buttonSkinConfig: ButtonSkinConfig(icon: icon),
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
