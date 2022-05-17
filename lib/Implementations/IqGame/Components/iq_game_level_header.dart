import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Game/Question/Model/question_info_status.dart';
import '../../../Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import '../../../Lib/Font/font_config.dart';

class IqGameLevelHeader extends StatelessWidget {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final ImageService _imageService = ImageService();
  int? score;
  VoidCallback? nextQuestion;
  VoidCallback? restartLevel;
  String? nextQuestionIconName;
  QuestionInfoStatus? questionInfoStatus;

  IqGameLevelHeader(
      {Key? key,
      this.nextQuestion,
      this.restartLevel,
      this.nextQuestionIconName,
      this.questionInfoStatus,
      this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Widget createLevelHeader(BuildContext context) {
    var myBackButton = MyBackButton();
    var margin = SizedBox(
      width: _screenDimensions.w(2),
    );
    return Container(
        height: _screenDimensions.dimen(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: getBtnContainerWidth(myBackButton.buttonSize),
                    child: myBackButton),
                margin,
                SizedBox(
                  width: getBtnContainerWidth(myBackButton.buttonSize),
                ),
                const Spacer(),
                createScoreText(),
                const Spacer(),
                createControlBtn(
                    myBackButton.buttonSize,
                    nextQuestionIconName ?? "btn_skip",
                    nextQuestionIconName == "btn_next",
                    nextQuestion),
                margin,
                createControlBtn(myBackButton.buttonSize, "btn_restart", false,
                    restartLevel),
              ],
            )));
  }

  Widget createScoreText() {
    if (score == null) {
      return Container();
    }
    var fontColor = Colors.green.shade400;
    var scoreText = MyText(
        text: score! > 0 ? "+" + score.toString() : "0",
        fontConfig: FontConfig(
            fontColor: fontColor,
            fontWeight: FontWeight.w700,
            fontSize: FontConfig.getCustomFontSize(2)));
    return AnimateZoomInZoomOutText(
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

  Widget createControlBtn(Size size, String btnIconName,
      bool animateZoomInZoomOut, VoidCallback? voidCallback) {
    if (voidCallback == null) {
      return SizedBox(
        width: getBtnContainerWidth(size),
      );
    }
    var btn = MyButton(
        size: size,
        onClick: () {
          voidCallback.call();
        },
        buttonSkinConfig: ButtonSkinConfig(
          image: (_imageService.getSpecificImage(
              imageName: btnIconName,
              imageExtension: "png",
              module: "buttons",
              maxWidth: size.width)),
        ));
    return SizedBox(
        width: getBtnContainerWidth(size),
        child: animateZoomInZoomOut
            ? AnimateZoomInZoomOut(
                toAnimateWidgetSize: size, toAnimateWidget: btn)
            : btn);
  }

  double getBtnContainerWidth(Size size) => size.width * 1.2;
}
