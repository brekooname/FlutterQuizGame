import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_gamecontext_service.dart';
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
  final bool animateScore;
  final bool animateWrongAnswer;
  final bool animateStepIncrease;
  final bool allQuestionsAnswered;
  final int score;
  final int availableHints;
  final int consecutiveCorrectAnswers;
  final int nrOfCorrectAnsweredQuestions;

  final VoidCallback hintButtonOnClick;
  final bool disableHintBtn;

  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();

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

    var headerHeight = _screenDimensions.dimen(16);
    var headerButtonsContainer = SizedBox(
        height: headerHeight,
        child: Padding(
            padding: EdgeInsets.all(_screenDimensions.dimen(1)),
            child: Row(
              children: <Widget>[
                MyBackButton(),
                SizedBox(width: _screenDimensions.dimen(2)),
                const Spacer(),
                hintBtn,
              ],
            )));

    var progressBarWidth = _screenDimensions.dimen(65);
    Widget scoreContainer = SizedBox(
      width: progressBarWidth,
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            width: _screenDimensions.dimen(20),
          ),
          createScoreContainer(),
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
          totalNr: GeoQuizGameContextService.numberOfQuestionsPerGame,
          startNr: nrOfCorrectAnsweredQuestions - 1,
          endNr: nrOfCorrectAnsweredQuestions,
        ),
        headerButtonsContainer,
        scoreContainer
      ],
    );

    return stack;
  }

  Widget createScoreContainer() {
    var gameFinishedScore = score * consecutiveCorrectAnswers;
    var scoreText = MyText(
      text: allQuestionsAnswered
          ? gameFinishedScore.toString()
          : score.toString(),
      fontConfig: FontConfig(
          fontColor: Colors.yellow,
          borderColor: Colors.black,
          fontSize: FontConfig.bigFontSize),
    );
    return allQuestionsAnswered
        ? AnimateIncreaseNumberText(
            audioPlayerId: "ScoreContainerAudioId",
            startNr: score,
            endNr: gameFinishedScore,
            toAnimateText: scoreText)
        : scoreText;
  }

  Widget createMultiplierContainer() {
    var multiplier = MyText(
      width: _screenDimensions.dimen(20),
      text: consecutiveCorrectAnswers == 0 && !animateWrongAnswer
          ? ""
          : (consecutiveCorrectAnswers).toString() + "X",
      fontConfig: FontConfig(
          borderWidth: FontConfig.standardBorderWidth,
          borderColor: Colors.green.shade900,
          fontColor: consecutiveCorrectAnswers == 0
              ? Colors.white
              : Colors.lightGreenAccent.shade200,
          fontSize: FontConfig.getCustomFontSize(1.1)),
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
        executeAnimationOnlyOnce: true,
        colorTo: colorTo,
        toAnimateText: myText);
  }
}
