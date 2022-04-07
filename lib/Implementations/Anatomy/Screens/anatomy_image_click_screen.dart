import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/ImageClick/image_click_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class AnatomyImageClickScreen
    extends GameScreen<AnatomyGameContext, AnatomyScreenManagerState>
    with ImageClickScreen<QuizQuestionManager> {
  AnatomyGameQuestionConfig gameQuestionConfig = AnatomyGameQuestionConfig();

  AnatomyImageClickScreen(
    AnatomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AnatomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AnatomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initImageClickScreen(
        QuizQuestionManager<AnatomyGameContext, AnatomyLocalStorage>(
            gameContext, currentQuestionInfo, AnatomyLocalStorage()),
        currentQuestionInfo);
  }

  @override
  State<AnatomyImageClickScreen> createState() =>
      AnatomyImageClickScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AnatomyImageClickScreenState extends State<AnatomyImageClickScreen>
    with ScreenState, LabelMixin {
  @override
  Widget build(BuildContext context) {
    var mainColumn = Column(children: <Widget>[
      AnatomyLevelHeader(
        questionText: widget.currentQuestionInfo.question.questionToBeDisplayed,
        disableHintBtn:
        widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
        hintButtonOnClick: () {
          widget.quizQuestionManager.onHintButtonClick(setStateCallback);
        },
        availableHints: widget.gameContext.amountAvailableHints,
      ),
      widget.createImageClickContainer(
          widget.gameQuestionConfig.categoryDiagramImgDimen
              .get<QuestionCategory, Size>(
                  widget.currentQuestionInfo.question.category)!, () {
        setState(() {});
      }, widget.goToNextGameScreenCallBack(context))
    ]);

    return mainColumn;
  }

  void setStateCallback() {
    setState(() {});
  }
}
