import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../Font/font_util.dart';
import 'my_popup.dart';

class GameFinishedPopup extends StatelessWidget with MyPopup, LabelMixin {
  final int? highScore;
  final bool isGameFinishedSuccess;
  final VoidCallback playAgainClick;
  final VoidCallback goBackClick;

  GameFinishedPopup(
      {Key? key,
      this.isGameFinishedSuccess = true,
      this.highScore,
      required this.playAgainClick,
      required this.goBackClick})
      : super(key: key);

  @override
  AlertDialog build(BuildContext context) {
    initPopup();
    return createDialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            imageService.getMainImage(
                imageName: getImageName(),
                module: "popup",
                imageExtension: "png",
                maxWidth: defaultBackgroundImageWidth),
            SizedBox(height: screenDimensions.dimen(9)),
            MyText(
              text: getGameFinishedText(),
              fontColor: FontUtil.getFontDefaultColorForContrast(),
              maxLines: 3,
              width: width / 1.2,
            ),
            highScore == null ? Container() : buildHighScoreText(),
            margin,
            MyButton(
                text: label.l_play_again,
                backgroundColor: Colors.lightGreenAccent,
                onClick: () {
                  onClickGoBack(context);
                  playAgainClick.call();
                }),
            SizedBox(height: screenDimensions.dimen(11)),
            MyButton(
              text: label.l_go_back,
              backgroundColor: Colors.grey.shade300,
              onClick: () => onClickGoBack(context),
            ),
            SizedBox(height: screenDimensions.dimen(9)),
          ],
        ),
        onCloseBtnClick: () => onClickGoBack(context));
  }

  void onClickGoBack(BuildContext context) {
    closePopup();
    goBackClick.call();
  }

  MyText buildHighScoreText() {
    return MyText(
      text: formatTextWithOneParam(
          label.l_high_score_param0, highScore.toString()),
      maxLines: 3,
      fontConfig: FontConfig(
          fontColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          borderWidth: FontConfig.standardBorderWidth * 1.2,
          fontSize: FontConfig.normalFontSize,
          borderColor: Colors.green),
      width: width / 1.2,
    );
  }

  String getGameFinishedText() {
    if (highScore != null) {
      return label.l_congratulations_game_finished;
    } else if (isGameFinishedSuccess) {
      return label.l_congratulations_game_finished;
    } else {
      return label.l_level_failed_try_again;
    }
  }

  String getImageName() {
    if (highScore != null) {
      return "popup_highscore_background";
    } else if (isGameFinishedSuccess) {
      return "popup_level_success_backgorund";
    } else {
      return "popup_level_failed_backgorund";
    }
  }
}
