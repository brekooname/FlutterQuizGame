import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

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
  Question question;
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
    var margin = screenDimensions.h(1);
    var questionPrefixToBeDisplayed = question.questionPrefixToBeDisplayed;
    Widget questionPrefix;
    if (questionPrefixToBeDisplayed.isEmpty) {
      questionPrefix = Container();
    } else {
      questionPrefix = Padding(
          padding: EdgeInsets.fromLTRB(0, margin, 0, 0),
          child: MyText(
            width: screenDimensions.w(99),
            maxLines: 2,
            text: questionPrefixToBeDisplayed,
            fontSize: FontConfig.getCustomFontSize(0.9),
          ));
    }
    var questionText = Padding(
        padding: EdgeInsets.fromLTRB(0, margin, 0, margin),
        child: MyText(
          width: screenDimensions.w(99),
          maxLines: 2,
          text: question.questionToBeDisplayed,
          fontSize: FontConfig.getCustomFontSize(1.2),
        ));

    var questionColumn = Column(
      children: [questionPrefix, questionText],
    );

    return Container(
        child: Column(children: [
      createScoreHeader(context),
      SizedBox(height: screenDimensions.h(1)),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green.shade100.withAlpha(150),
              border: Border.all(
                  color: Colors.green.shade200, width: screenDimensions.w(1)),
              borderRadius:
                  BorderRadius.circular(FontConfig.getStandardBorderRadius())),
          child: questionColumn,
        ),
        SizedBox(height: screenDimensions.h(1)),
      ])
    ]));
  }

  Widget createScoreHeader(BuildContext context) {
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
          color: Colors.lightBlueAccent.withOpacity(0.3),
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
