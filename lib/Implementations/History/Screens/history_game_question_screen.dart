import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import 'history_game_timeline_screen.dart';

class HistoryGameQuestionScreen
    extends GameScreen<HistoryGameContext, HistoryGameScreenManagerState>
    with QuizOptionsGameScreen<HistoryGameContext> {
  HistoryGameQuestionScreen(
    HistoryGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required HistoryGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            HistoryCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initQuizOptionsScreen(
        gameContext, HistoryLocalStorage(), currentQuestionInfo,
        questionImage: imageService.getSpecificImage(
            module: "questions/images/" + difficulty.name + "/" + category.name,
            imageExtension: "jpeg",
            imageName: "i" + currentQuestionInfo.question.index.toString()));
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return HistoryGameTimelineScreen.showInterstitialAdEveryNQuestions;
  }

  @override
  State<HistoryGameQuestionScreen> createState() =>
      HistoryGameQuestionScreenState();
}

class HistoryGameQuestionScreenState extends State<HistoryGameQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      widget.onHintButtonClick(setStateCallback);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build question");
    HistoryGameLevelHeader header = createHeader();
    Widget questionContainer = createQuestionTextContainer(
      widget.currentQuestionInfo.question,
      widget.category == HistoryGameQuestionConfig().cat0 ? 1 : 2,
      widget.category == HistoryGameQuestionConfig().cat3 ? 4 : 2,
    );
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.goToNextGameScreenCallBack(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[header, questionContainer, optionsRows],
    );
  }

  HistoryGameLevelHeader createHeader() {
    var header = HistoryGameLevelHeader(
      availableHints: widget.gameContext.amountAvailableHints,
      animateScore: widget.isGameFinishedSuccessful(),
      disableHintBtn: widget.hintDisabledPossibleAnswers.isNotEmpty,
      score: formatTextWithOneParam(
          label.l_score_param0,
          widget.quizGameLocalStorage
                  .getWonQuestionsForDiff(widget.difficulty)
                  .length
                  .toString() +
              "/" +
              widget.gameContext.totalNrOfQuestionsForCampaignLevel.toString()),
      hintButtonOnClick: () {
        widget.onHintButtonClick(setStateCallback);
      },
    );
    return header;
  }

  void setStateCallback() {
    setState(() {});
  }
}
