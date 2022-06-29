import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';
import 'dart:math' as math;

import '../../../Game/Question/Model/question_info_status.dart';
import '../../../Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import '../../../Lib/Font/font_config.dart';

class IqGameLevelHeader extends StatelessWidget {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  int? score;
  VoidCallback? nextQuestion;
  VoidCallback? skipQuestion;
  VoidCallback? restartLevel;
  QuestionInfoStatus? questionInfoStatus;

  IqGameLevelHeader(
      {Key? key,
      this.nextQuestion,
      this.restartLevel,
      this.skipQuestion,
      this.questionInfoStatus,
      this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Widget createLevelHeader(BuildContext context) {
    int totalNrOfElementsInHeader = 10;
    double elementWidth = _screenDimensions.w(100) / totalNrOfElementsInHeader;
    Size btnSize = Size(elementWidth, elementWidth);
    var myBackButton = MyBackButton();
    var emptyBtnSize = SizedBox(
      width: elementWidth,
    );
    List<Widget> headerElements = [];
    headerElements.add(SizedBox(width: elementWidth, child: myBackButton));
    headerElements.add(emptyBtnSize);
    headerElements.add(emptyBtnSize);
    headerElements.add(emptyBtnSize);
    headerElements.add(createScoreText(elementWidth));
    headerElements.addAll(_createControlBtns(emptyBtnSize, btnSize));
    return SizedBox(
        height: myBackButton.buttonSize.height * 1.5,
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: headerElements,
            )));
  }

  List<Widget> _createControlBtns(SizedBox emptyBtnSize, Size btnSize) {
    List<Widget> controlBtns = [];
    if (nextQuestion == null) {
      controlBtns
          .add(_createControlBtn(btnSize, "btn_next", true, nextQuestion));
      controlBtns
          .add(_createControlBtn(btnSize, "btn_skip", false, skipQuestion));
    } else {
      controlBtns
          .add(_createControlBtn(btnSize, "btn_skip", false, skipQuestion));
      controlBtns
          .add(_createControlBtn(btnSize, "btn_next", true, nextQuestion));
    }
    controlBtns.add(emptyBtnSize);
    controlBtns
        .add(_createControlBtn(btnSize, "btn_restart", false, restartLevel));
    return controlBtns;
  }

  Widget createScoreText(double textWidth) {
    if (score == null) {
      return SizedBox(
        width: textWidth,
      );
    }
    var fontColor = Colors.lightGreenAccent.shade700;
    var scoreText = MyText(
        maxLines: 1,
        width: textWidth,
        text: (score ?? 0).toString(),
        fontConfig: FontConfig(
            fontColor: fontColor,
            borderColor: Colors.black,
            borderWidth: FontConfig.standardBorderWidth,
            fontWeight: FontWeight.w700,
            fontSize: FontConfig.getCustomFontSize(1.8)));
    return questionInfoStatus == QuestionInfoStatus.open
        ? scoreText
        : AnimateZoomInZoomOutText(
            zoomAmount: questionInfoStatus == QuestionInfoStatus.lost
                ? 0.8
                : questionInfoStatus == QuestionInfoStatus.won
                    ? 1.1
                    : 1,
            executeAnimationOnlyOnce: true,
            colorTo: questionInfoStatus == QuestionInfoStatus.lost
                ? Colors.red
                : fontColor,
            toAnimateText: scoreText);
  }

  Widget _createControlBtn(Size size, String btnIconName,
      bool animateZoomInZoomOut, VoidCallback? onBtnClick) {
    if (onBtnClick == null) {
      return SizedBox(
        width: size.width,
      );
    }
    ImageService imageService = ImageService();
    Widget btn = MyButton(
        size: size,
        onClick: () {
          onBtnClick.call();
        },
        buttonSkinConfig: ButtonSkinConfig(
          image: (imageService.getSpecificImage(
              imageName: btnIconName,
              imageExtension: "png",
              module: "buttons",
              maxWidth: size.width / 1.2)),
        ));
    if (FontConfig.isRtlLanguage) {
      btn = Transform.rotate(
        angle: -math.pi,
        child: btn,
      );
    }
    return SizedBox(
        width: size.width,
        height: size.height,
        child: animateZoomInZoomOut
            ? AnimateZoomInZoomOut(
                zoomAmount: 3, toAnimateWidgetSize: size, toAnimateWidget: btn)
            : btn);
  }
}
