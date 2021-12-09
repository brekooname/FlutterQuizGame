import 'package:flutter/material.dart';

import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';

class HistoryGameLevelHeader extends StatelessWidget {
  String score;
  bool animateScore;
  int availableHints;
  String question;
  VoidCallback hintButtonOnClick;
  bool isRewardedAdLoaded;
  ScreenDimensionsService screenDimensions;

  HistoryGameLevelHeader(
      {required this.score,
      this.animateScore = false,
      this.isRewardedAdLoaded = false,
      required this.hintButtonOnClick,
      required this.availableHints,
      required this.question,
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
            border: Border.all(
                color: Colors.green.shade200, width: screenDimensions.w(1)),
            borderRadius:
                BorderRadius.circular(FontConfig.getStandardBorderRadius())),
        child: questionText,
      ),
      SizedBox(height: screenDimensions.h(1)),
    ]));
  }

  Widget createGreenHeader(BuildContext context) {
    var backBtn = MyBackButton(context: context);
    var hintBtn = HintButton(
        onClick: this.hintButtonOnClick,
        availableHints: this.availableHints,
        disabled: false,
        watchRewardedAdForHint: true,
        showAvailableHintsText: true);

    var scoreTextWidth = screenDimensions.w(40);
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
                hintBtn,
              ],
            )));
  }
}
