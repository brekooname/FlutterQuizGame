import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';

class HistoryGameLevelHeader extends StatelessWidget {
  int score;
  bool animateScore;
  int availableHints;
  String historyEra;
  String question;
  VoidCallback hintButtonOnClick;
  VoidCallback onWatchRewardedAdReward;
  bool isRewardedAdLoaded;
  MyAppContext myAppContext;
  ScreenDimensionsService screenDimensions;

  HistoryGameLevelHeader(
      {this.score = 0,
      this.animateScore = false,
      this.isRewardedAdLoaded = false,
      required this.hintButtonOnClick,
      required this.onWatchRewardedAdReward,
      required this.availableHints,
      required this.historyEra,
      required this.question,
      required this.myAppContext,
      required this.screenDimensions});

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Container createLevelHeader(BuildContext context) {
    var questionText = MyText(
      width: screenDimensions.w(99),
      maxLines: 2,
      text: question,
      fontConfig: FontConfig(fontSize: FontConfig.getCustomFontSize(1.2)),
    );

    return Container(
        child: Column(children: [
      createGreenHeader(context),
      SizedBox(height: screenDimensions.h(1)),
      Container(
        height: screenDimensions.h(11),
        decoration: BoxDecoration(
          color: Colors.green.shade100.withAlpha(150),
        ),
        child: questionText,
      ),
      SizedBox(height: screenDimensions.h(1)),
    ]));
  }

  Widget createGreenHeader(BuildContext context) {
    print("0000000000000000000000000000000000ISREWARDEDADLOADED" + isRewardedAdLoaded.toString());

    var backBtn = MyBackButton(context: context);
    var hintBtn = HintButton(
        onClick: this.hintButtonOnClick,
        availableHints: this.availableHints,
        isRewardedAdLoaded: isRewardedAdLoaded,
        disabled: false,
        watchRewardedAdForHint: true,
        onWatchRewardedAdReward: onWatchRewardedAdReward,
        showAvailableHintsText: true);

    var scoreTextWidth = screenDimensions.w(10);
    var scoreText = MyText(
      maxLines: 1,
      width: scoreTextWidth,
      text: this.score.toString(),
      fontConfig: FontConfig(
          textColor: Colors.yellow,
          borderColor: Colors.black,
          fontSize: FontConfig.getBigFontSize()),
    );

    return Container(
        height: screenDimensions.h(9),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent.withAlpha(150),
        ),
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.w(1)),
            child: Row(
              children: <Widget>[
                backBtn,
                SizedBox(width: screenDimensions.w(2)),
                SizedBox(
                    width: scoreTextWidth,
                    child: animateScore
                        ? AnimateZoomInZoomOutText(
                            zoomAmount: 1.4,
                            zoomInZoomOutOnce: true,
                            toAnimateText: scoreText)
                        : scoreText),
                Spacer(),
                MyText(
                  width: screenDimensions.w(50),
                  text: historyEra,
                  fontConfig: FontConfig(
                      textColor: Colors.green.shade600,
                      fontSize: FontConfig.getNormalFontSize()),
                ),
                Spacer(),
                hintBtn,
              ],
            )));
  }
}
