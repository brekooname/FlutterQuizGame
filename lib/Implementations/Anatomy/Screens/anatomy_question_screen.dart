import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Components/anatomy_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class AnatomyQuestionScreen
    extends GameScreen<AnatomyGameContext, AnatomyScreenManagerState>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  AnatomyQuestionScreen(
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
    var questionConfig = AnatomyGameQuestionConfig();
    var questionImg = difficulty == questionConfig.diff4
        ? imageService.getSpecificImage(
            module: "questions/" + difficulty.name + "/" + category.name,
            imageExtension: "png",
            imageName: currentQuestionInfo.question.index.toString())
        : null;
    initQuizOptionsScreen(
      QuizQuestionManager<AnatomyGameContext, AnatomyLocalStorage>(
          gameContext, currentQuestionInfo, AnatomyLocalStorage()),
      currentQuestionInfo,
      questionImage: questionImg,
    );
  }

  @override
  State<AnatomyQuestionScreen> createState() => AnatomyQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AnatomyQuestionScreenState extends State<AnatomyQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    Widget questionContainer = createQuestionTextContainer(
      widget.currentQuestionInfo.question,
      1,
      4,
    );
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.goToNextGameScreenCallBack(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnatomyLevelHeader(
          questionText: "",
          disableHintBtn:
          widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
          hintButtonOnClick: () {
            widget.quizQuestionManager.onHintButtonClick(setStateCallback);
          },
          availableHints: widget.gameContext.amountAvailableHints,
        ),
        questionContainer,
        optionsRows
      ],
    );
  }

  void setStateCallback() {
    setState(() {});
  }
}
