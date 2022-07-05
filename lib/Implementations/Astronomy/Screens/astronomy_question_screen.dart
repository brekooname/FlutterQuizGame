import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Animation/animation_background.dart';

class AstronomyQuestionScreen
    extends GameScreen<AstronomyGameContext, AstronomyScreenManagerState>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  final AstronomyGameQuestionConfig _astronomyGameQuestionConfig =
      AstronomyGameQuestionConfig();

  AstronomyQuestionScreen(
    AstronomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AstronomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AstronomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
            gameContext, currentQuestionInfo, AstronomyLocalStorage()),
        currentQuestionInfo);
  }

  @override
  State<AstronomyQuestionScreen> createState() =>
      AstronomyQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AstronomyQuestionScreenState extends State<AstronomyQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    var planetDimen = screenDimensions.dimen(25);
    var question = widget.currentQuestionInfo.question;
    var planetId = question.index;
    var quizAnswerOptions =
        question.questionService.getQuizAnswerOptions(question);
    var container = Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              fontColor: Colors.white,
              text: question.questionToBeDisplayed,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createOptionBtn(
                  quizAnswerOptions.elementAt(0),
                ),
                createOptionBtn(
                  quizAnswerOptions.elementAt(1),
                )
              ],
            ),
            MyText(
                fontColor: Colors.white,
                text: widget._astronomyGameQuestionConfig.planets
                    .where((element) => element.id == planetId)
                    .first
                    .name),
            imageService.getSpecificImage(
                maxWidth: planetDimen,
                maxHeight: planetDimen,
                module: "planets",
                imageName: planetId.toString(),
                imageExtension: "png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                createOptionBtn(
                  quizAnswerOptions.elementAt(2),
                ),
                createOptionBtn(
                  quizAnswerOptions.elementAt(3),
                )
              ],
            ),
          ]),
    );
    return AnimateBackground(
        mainContent: container,
        particleImage: imageService.getSpecificImage(
            imageName: "stars", imageExtension: "png"));
  }

  Widget createOptionBtn(String optText) {
    return MyButton(
      disabled: !widget.currentQuestionInfo.isQuestionOpen(),
      text: optText,
      onClick: () {
        widget.quizQuestionManager.onClickAnswerOptionBtn(
            widget.currentQuestionInfo.question,
            optText,
            setStateCallback,
            widget.goToNextGameScreenCallBack(context));
      },
    );
  }

  void setStateCallback() {
    setState(() {});
  }
}
