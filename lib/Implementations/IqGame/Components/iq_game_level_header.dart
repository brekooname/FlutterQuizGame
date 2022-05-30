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
    var myBackButton = MyBackButton();
    var margin = SizedBox(
      width: _screenDimensions.w(2),
    );
    var emptyBtnSize = SizedBox(
      width: _getBtnContainerWidth(myBackButton.buttonSize),
    );
    return SizedBox(
        height: _screenDimensions.dimen(16),
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: _getBtnContainerWidth(myBackButton.buttonSize),
                    child: myBackButton),
                emptyBtnSize,
                emptyBtnSize,
                createScoreText(myBackButton.buttonSize.width / 1.2),
                _createControlBtn(
                    myBackButton.buttonSize, "btn_skip", false, skipQuestion),
                _createControlBtn(
                    myBackButton.buttonSize, "btn_next", true, nextQuestion),
                _createControlBtn(myBackButton.buttonSize, "btn_restart", false,
                    restartLevel),
              ],
            )));
  }

  Widget createScoreText(double textWidth) {
    if (score == null) {
      return Container();
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
        width: _getBtnContainerWidth(size),
      );
    }
    ImageService imageService = ImageService();
    var btn = MyButton(
        size: size,
        onClick: () {
          onBtnClick.call();
        },
        buttonSkinConfig: ButtonSkinConfig(
          image: (imageService.getSpecificImage(
              imageName: btnIconName,
              imageExtension: "png",
              module: "buttons",
              maxWidth: size.width)),
        ));
    return SizedBox(
        width: _getBtnContainerWidth(size),
        child: animateZoomInZoomOut
            ? AnimateZoomInZoomOut(
                toAnimateWidgetSize: size, toAnimateWidget: btn)
            : btn);
  }

  static double _getBtnContainerWidth(Size size) => size.width * 1.2;
}
