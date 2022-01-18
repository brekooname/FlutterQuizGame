import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_color_in_color_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_increase_number_text.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_zoom_in_zoom_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/hint_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Font/font_config.dart';
import '../../../main.dart';

class GeoQuizGameLevelHeader extends StatelessWidget {
  bool animateScore;
  bool animateWrongAnswer;
  bool animateStepIncrease;
  bool allQuestionsAnswered;
  int score;
  int availableHints;
  int consecutiveCorrectAnswers;
  int nrOfCorrectAnsweredQuestions;

  VoidCallback hintButtonOnClick;
  bool disableHintBtn;

  ScreenDimensionsService screenDimensions = ScreenDimensionsService();

  @override
  Widget build(BuildContext context) {
    return createLevelHeader(context);
  }

  GeoQuizGameLevelHeader(
      {Key? key,
      this.animateScore = false,
      this.animateWrongAnswer = false,
      this.animateStepIncrease = false,
      this.allQuestionsAnswered = false,
      this.disableHintBtn = false,
      required this.score,
      required this.nrOfCorrectAnsweredQuestions,
      required this.hintButtonOnClick,
      required this.availableHints,
      required this.consecutiveCorrectAnswers})
      : super(key: key);

  Widget createLevelHeader(BuildContext context) {
    var hintBtn = HintButton(
        onClick: hintButtonOnClick,
        availableHints: availableHints,
        disabled: disableHintBtn,
        watchRewardedAdForHint: MyApp.isExtraContentLocked,
        showAvailableHintsText: true);

    var headerHeight = screenDimensions.h(9);
    var headerButtonsContainer = SizedBox(
        height: headerHeight,
        child: Padding(
            padding: EdgeInsets.all(screenDimensions.w(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: screenDimensions.w(2)),
                const Spacer(),
                hintBtn,
              ],
            )));

    var lightGreenAccent = Colors.lightGreenAccent;
    var progressBarWidth = screenDimensions.w(65);
    Widget scoreContainer = SizedBox(
      width: progressBarWidth,
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            width: screenDimensions.w(20),
          ),
          const Spacer(),
          createScoreContainer(),
          const Spacer(),
          createMultiplierContainer(),
          const Spacer(),
        ],
      ),
    );

    Stack stack = Stack(
      alignment: Alignment.center,
      children: [
        ProgressBar(
          width: progressBarWidth,
          height: headerHeight / 1.5,
          fillBarColor: Colors.purpleAccent.shade100.withOpacity(0.4),
          animateStepIncrease: animateStepIncrease,
          currentStep: nrOfCorrectAnsweredQuestions,
          widthPerStep: progressBarWidth /
              GeoQuizGameContextService.numberOfQuestionsPerGame,
        ),
        headerButtonsContainer,
        scoreContainer
      ],
    );

    return stack;
  }

  Widget createScoreContainer() {
    var scoreText = MyText(
      text: (score > 0 ? "+" : "") + score.toString(),
      fontConfig: FontConfig(
          textColor: Colors.lightGreenAccent,
          borderColor: Colors.black,
          fontSize: FontConfig.bigFontSize),
    );
    return allQuestionsAnswered
        ? AnimateIncreaseNumberText(
            startNr: score,
            endNr: score * (consecutiveCorrectAnswers + 1),
            toAnimateText: scoreText)
        : scoreText;
  }

  Widget createMultiplierContainer() {
    var multiplier = MyText(
      width: screenDimensions.w(20),
      text: "x " + (consecutiveCorrectAnswers + 1).toString(),
      fontConfig: FontConfig(
          textColor: Colors.white,
          borderColor: Colors.black,
          fontSize: FontConfig.getCustomFontSize(1.2)),
    );
    return animateScore
        ? _createAnimateZoomInZoomOutText(Colors.lightGreenAccent, multiplier)
        : (animateWrongAnswer
            ? _createAnimateZoomInZoomOutText(Colors.red, multiplier)
            : multiplier);
  }

  AnimateZoomInZoomOutText _createAnimateZoomInZoomOutText(
      Color colorTo, MyText myText) {
    return AnimateZoomInZoomOutText(
        zoomAmount: 1.4,
        zoomInZoomOutOnce: true,
        colorTo: colorTo,
        toAnimateText: myText);
  }
}