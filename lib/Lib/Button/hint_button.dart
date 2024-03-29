import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class HintButton extends StatefulWidget {
  final ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  final AdService _adService = AdService();
  late final Size buttonSize;
  late final bool disableButton;
  final VoidCallback onClick;
  final bool showAvailableHintsText;
  final bool watchRewardedAdForHint;
  final int availableHints;

  HintButton(
      {Key? key,
      Size? buttonSize,
      bool disabled = false,
      this.availableHints = 1,
      required this.onClick,
      this.watchRewardedAdForHint = false,
      this.showAvailableHintsText = false})
      : super(key: key) {
    var side = screenDimensions.dimen(14);
    disableButton = availableHints <= 0 && !watchRewardedAdForHint || disabled;
    this.buttonSize = buttonSize ?? Size(side, side);
    if (watchRewardedAdForHint && _adService.watchRewardedAdPopup == null) {
      throw Exception(
          "Init watchRewardedAdPopup inside initState() method with: initScreenState(onUserEarnedReward: () {  _onHintButtonClick();  });");
    }
  }

  @override
  State<HintButton> createState() => HintButtonState();
}

class HintButtonState extends State<HintButton> {
  @override
  Widget build(BuildContext context) {
    var shouldShowRewardedAd =
        widget.availableHints <= 0 && widget.watchRewardedAdForHint;
    Image icon = ImageService().getMainImage(
        imageName: shouldShowRewardedAd ? "btn_hint_ad" : "btn_hint",
        imageExtension: "png",
        module: "buttons",
        maxWidth: widget.buttonSize.width);

    var btn = MyButton(
        size: widget.buttonSize,
        disabled: widget.disableButton,
        onClick: shouldShowRewardedAd
            ? () {
                MyPopup.showPopup(widget._adService.watchRewardedAdPopup!);
              }
            : widget.onClick,
        buttonSkinConfig: ButtonSkinConfig(image: icon),
        fontConfig: FontConfig());

    var fittedBtn = SizedBox(
        width: widget.buttonSize.width,
        height: widget.buttonSize.height,
        child: widget.disableButton
            ? btn
            : AnimateZoomInZoomOut(
                toAnimateWidgetSize: widget.buttonSize,
                toAnimateWidget: btn,
              ));

    return widget.showAvailableHintsText && !shouldShowRewardedAd
        ? Stack(
            children: [fittedBtn, createHintAmountText()],
          )
        : fittedBtn;
  }

  SizedBox createHintAmountText() {
    return SizedBox(
        width: widget.buttonSize.width,
        height: widget.buttonSize.height,
        child: MyText(
          alignmentInsideContainer: Alignment.bottomRight,
          text: (widget.availableHints < 0 ? 0 : widget.availableHints)
              .toString(),
          fontConfig: FontConfig(
              fontSize: FontConfig.normalFontSize,
              fontColor: Colors.lightGreenAccent,
              borderWidth: FontConfig.standardBorderWidth * 1.2,
              borderColor: Colors.black),
        ));
  }
}
