import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import 'history_game_timeline_screen.dart';

class HistoryGameQuestionScreen extends GameScreen<HistoryGameContext,
        HistoryGameScreenManagerState, HistoryCampaignLevelService>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  HistoryGameQuestionScreen(
    HistoryGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required HistoryGameContext gameContext,
  }) : super(gameScreenManagerState, gameContext,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<HistoryGameContext, HistoryLocalStorage>(
            gameContext, currentQuestionInfo, HistoryLocalStorage()),
        currentQuestionInfo,
        questionImage: imageService.getSpecificImage(
            module: "questions/images/" + difficulty.name + "/" + category.name,
            imageExtension: "jpeg",
            imageName: "i" + currentQuestionInfo.question.index.toString()));
  }

  @override
  HistoryCampaignLevelService get campaignLevelService =>
      HistoryCampaignLevelService();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return HistoryGameTimelineScreen.showInterstitialAdEveryNQuestions;
  }

  @override
  State<HistoryGameQuestionScreen> createState() =>
      HistoryGameQuestionScreenState();
}

class HistoryGameQuestionScreenState extends State<HistoryGameQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      widget.quizQuestionManager.onHintButtonClickForDiff(setStateCallback);
    });
  }

  @override
  Widget build(BuildContext context) {
    HistoryGameLevelHeader header = createHeader();
    var historyGameQuestionConfig = HistoryGameQuestionConfig();
    Widget questionContainer = createQuestionTextContainer(
      widget.currentQuestionInfo.question,
      widget.category == historyGameQuestionConfig.cat0 ? 1 : 2,
      widget.category == historyGameQuestionConfig.cat3 ? 4 : 2,
    );
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.processNextGameScreenCallBack());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[header, questionContainer, optionsRows],
    );
  }

  HistoryGameLevelHeader createHeader() {
    var header = HistoryGameLevelHeader(
      availableHints: widget.gameContext.amountAvailableHints,
      animateScore: widget.quizQuestionManager.isGameFinishedSuccessful(),
      disableHintBtn:
          widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
      score: formatTextWithOneParam(
          label.l_score_param0,
          widget.quizQuestionManager.quizGameLocalStorage
                  .getWonQuestionsForDiff(widget.difficulty)
                  .length
                  .toString() +
              "/" +
              widget.gameContext.totalNrOfQuestionsForCampaignLevel.toString()),
      hintButtonOnClick: () {
        widget.quizQuestionManager.onHintButtonClickForDiff(setStateCallback);
      },
    );
    return header;
  }

  void setStateCallback() {
    setState(() {});
  }
}
