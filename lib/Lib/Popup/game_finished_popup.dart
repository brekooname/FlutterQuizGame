import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import 'my_popup.dart';

class GameFinishedPopup extends StatelessWidget with MyPopup {
  int? highScore;
  bool isGameFinishedSuccess;
  VoidCallback playAgainClick;
  VoidCallback goBackClick;

  GameFinishedPopup(
      {this.isGameFinishedSuccess = true,
      this.highScore,
      required this.playAgainClick,
      required this.goBackClick});

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
                maxWidth: defaultBackgroundImageWidth),
            SizedBox(height: screenDimensions.h(2)),
            MyText(
              text: getGameFinishedText(),
              maxLines: 3,
              width: width / 1.2,
            ),
            highScore == null ? Container() : buildHighScoreText(),
            SizedBox(height: screenDimensions.h(5)),
            MyButton(
                text: label.l_play_again,
                backgroundColor: Colors.lightGreenAccent,
                onClick: () {
                  onClickGoBack(context);
                  playAgainClick.call();
                }),
            SizedBox(height: screenDimensions.h(4)),
            MyButton(
              text: label.l_go_back,
              backgroundColor: Colors.grey.shade300,
              onClick: () => onClickGoBack(context),
            ),
            SizedBox(height: screenDimensions.h(2)),
          ],
        ),
        context: context,
        onCloseBtnClick: () => onClickGoBack(context));
  }

  void onClickGoBack(BuildContext context) {
    closePopup(context);
    goBackClick.call();
  }

  MyText buildHighScoreText() {
    return MyText(
      text: formatTextWithOneParam(
          label.l_high_score_param0, highScore.toString()),
      maxLines: 3,
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
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
