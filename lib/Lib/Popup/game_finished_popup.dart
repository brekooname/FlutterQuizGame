import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/rate_app_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import 'my_popup.dart';

class GameFinishedPopup extends StatelessWidget with MyPopup {

  int? highScore;
  bool isGameFinishedSuccess;
  Size? popupSize;
  VoidCallback playAgainClick;

  GameFinishedPopup(
      {this.isGameFinishedSuccess = true,
      this.popupSize,
      this.highScore,
      required this.playAgainClick});

  @override
  Dialog build(BuildContext context) {
    initPopup(context);

    popupSize = popupSize ?? defaultSize;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(FontConfig.getStandardBorderRadius()),
            color: Colors.white),
        height: popupSize!.height,
        width: popupSize!.width,
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.w(2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                imageService.getMainImage(
                    imageName: getImageName(),
                    module: "general",
                    maxWidth: popupSize!.width / 2.6),
                SizedBox(height: screenDimensions.h(2)),
                MyText(
                  text: getGameFinishedText(),
                  maxLines: 3,
                  width: popupSize!.width / 1.2,
                ),
                highScore == null ? Container() : buildHighScoreText(),
                SizedBox(height: screenDimensions.h(5)),
                MyButton(
                    text: label.l_play_again,
                    backgroundColor: Colors.lightGreenAccent,
                    onClick: () {
                      var nav = Navigator.of(context);
                      nav.pop();
                      nav.pop();
                      playAgainClick.call();
                    }),
                SizedBox(height: screenDimensions.h(4)),
                MyButton(
                  text: label.l_go_back,
                  backgroundColor: Colors.grey.shade300,
                  onClick: () {
                    var nav = Navigator.of(context);
                    nav.pop();
                    nav.pop();
                  },
                ),
                SizedBox(height: screenDimensions.h(2)),
              ],
            )),
      ),
    );
  }

  MyText buildHighScoreText() {
    return MyText(
      text: formatTextWithOneParam(
          label.l_high_score_param0, highScore.toString()),
      maxLines: 3,
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          fontWeight: FontWeight.normal,
          borderWidth: FontConfig.getStandardBorderWidth() * 1.2,
          fontSize: FontConfig.getNormalFontSize(),
          borderColor: Colors.green),
      width: popupSize!.width / 1.2,
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
