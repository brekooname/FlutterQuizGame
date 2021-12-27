import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_fade_in_fade_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/enum_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/watch_rewarded_ad_popup.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class HistoryGameLevelHeader extends StatelessWidget {
  String score;
  bool animateScore;
  bool animateQuestionText;
  int availableHints;
  double? questionContainerHeight;
  Question? question;
  VoidCallback hintButtonOnClick;
  VoidCallback onBackButtonClick;
  bool disableHintBtn;
  CampaignLevel campaignLevel;
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  HistoryGameLevelHeader(
      {required this.score,
      required this.campaignLevel,
      this.questionContainerHeight,
      this.animateScore = false,
      this.animateQuestionText = false,
      this.disableHintBtn = false,
      required this.hintButtonOnClick,
      required this.onBackButtonClick,
      required this.availableHints,
      required this.question});

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  Container createLevelHeader(BuildContext context) {
    var vertMargin = screenDimensions.h(1);
    var horizMargin = screenDimensions.w(1);
    var questionPrefixToBeDisplayed = question?.questionPrefixToBeDisplayed;
    var questionToBeDisplayed = question?.questionToBeDisplayed;
    Widget questionPrefix;
    var questionColor = Colors.grey.shade900;
    var questionToBeDisplayedIsEmpty = (questionToBeDisplayed ?? "").isEmpty;
    if ((questionPrefixToBeDisplayed ?? "").isEmpty) {
      questionPrefix = Container();
    } else {
      questionPrefix = Padding(
          padding: EdgeInsets.fromLTRB(horizMargin, 0, horizMargin,
              questionToBeDisplayedIsEmpty ? 0 : vertMargin),
          child: MyText(
            textColor: questionToBeDisplayedIsEmpty
                ? questionColor
                : Colors.grey.shade700,
            width: screenDimensions.w(95),
            maxLines:
                question?.category == HistoryGameQuestionConfig().cat0 ? 1 : 2,
            text: questionPrefixToBeDisplayed ?? "",
            fontSize: FontConfig.getCustomFontSize(1),
          ));
    }
    Widget questionText;
    if (questionToBeDisplayedIsEmpty) {
      questionText = Container();
    } else {
      var text = MyText(
        textColor: questionColor,
        width: screenDimensions.w(95),
        maxLines:
            question?.category == HistoryGameQuestionConfig().cat3 ? 4 : 2,
        text: questionToBeDisplayed ?? "",
        fontSize: FontConfig.getCustomFontSize([
          Language.ja.name,
          Language.ko.name,
          Language.th.name
        ].contains(MyApp.languageCode)
            ? 0.8
            : 1.1),
      );
      questionText = Padding(
          padding: EdgeInsets.fromLTRB(horizMargin, 0, horizMargin, 0),
          child: animateQuestionText
              ? AnimateFadeInFadeOutText(
                  fadeInFadeOutOnce: true, toAnimateText: text)
              : text);
    }
    var questionColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: vertMargin),
        questionPrefix,
        questionText,
        SizedBox(height: vertMargin)
      ],
    );

    return Container(
        child: Column(children: [
      createScoreHeader(context),
      SizedBox(height: screenDimensions.h(1)),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          height: questionContainerHeight,
          decoration: BoxDecoration(
              color: Colors.green.shade100.withAlpha(150),
              border: Border.all(
                  color: Colors.green.shade200, width: screenDimensions.w(1)),
              borderRadius:
                  BorderRadius.circular(FontConfig.standardBorderRadius)),
          child: questionColumn,
        ),
        SizedBox(height: screenDimensions.h(1)),
      ])
    ]));
  }

  Widget createScoreHeader(BuildContext context) {
    var hintBtn = HintButton(
        onClick: this.hintButtonOnClick,
        availableHints: this.availableHints,
        disabled: disableHintBtn,
        watchRewardedAdForHint: MyApp.isExtraContentLocked,
        showAvailableHintsText: true);

    var scoreTextWidth = screenDimensions.w(60);
    var scoreText = MyText(
      maxLines: 1,
      width: scoreTextWidth,
      text: this.score.toString(),
      fontConfig: FontConfig(
          textColor: Colors.yellow,
          borderColor: Colors.black,
          fontSize: FontConfig.bigFontSize),
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
                MyBackButton(),
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
