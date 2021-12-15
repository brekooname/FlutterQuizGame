import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Internet/internet_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/watch_rewarded_ad_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../Lib/Button/button_skin_config.dart';
import '../../Lib/Font/font_config.dart';
import 'my_button.dart';

class HintButton extends StatefulWidget {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  InternetService _internetService = InternetService();
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
  State<HintButton> createState() => HintButtonState();
}

class HintButtonState extends State<HintButton> {
  @override
  void initState() {
    if (widget.watchRewardedAdForHint) {
      widget._internetService.hasInternet().then((hasInternet) {
        setState(() {
          widget.watchRewardedAdForHint = false;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shouldShowRewardedAd =
        widget.availableHints <= 0 && widget.watchRewardedAdForHint;
    var icon = ImageService().getMainImage(
        imageName: shouldShowRewardedAd ? "btn_hint_ad" : "btn_hint",
        module: "buttons",
        maxWidth: widget.buttonSize.width);

    if (widget.availableHints <= 0 && !widget.watchRewardedAdForHint) {
      this.widget.disabled = true;
    }

    var btn = MyButton(
        size: widget.buttonSize,
        disabled: widget.disabled,
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
            : widget.onClick,
        buttonSkinConfig: ButtonSkinConfig(image: icon),
        fontConfig: FontConfig());

    var fittedBtn = SizedBox(
        width: widget.buttonSize.width,
        height: widget.buttonSize.height,
        child: widget.disabled
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

  Widget buildWatchRewardedAdPopup(BuildContext context) {
    return WatchRewardedAdPopup(onUserEarnedReward: widget.onClick);
  }

  Container createHintAmountText() {
    return Container(
        width: widget.buttonSize.width,
        height: widget.buttonSize.height,
        child: MyText(
          alignmentInsideContainer: Alignment.bottomRight,
          text: widget.availableHints.toString(),
          fontConfig: FontConfig(
              fontSize: FontConfig.normalFontSize,
              textColor: Colors.lightGreenAccent,
              borderWidth: FontConfig.standardBorderWidth * 1.2,
              borderColor: Colors.black),
        ));
  }
}
