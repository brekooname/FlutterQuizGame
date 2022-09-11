import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_play.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class PersTestQuestionScreen extends GameScreen<PersTestGameContext,
    PersTestGameScreenManagerState, PersTestCampaignLevelService> {
  late PersTestGameTypePlay persTestGameType;

  PersTestQuestionScreen(
    PersTestGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required PersTestGameContext gameContext,
  }) : super(gameScreenManagerState, gameContext,
            [gameContext.currentQuestionInfo],
            key: key) {
    persTestGameType =
        PersTestGameTypePlay.createGameTypePlay(this, campaignLevel);
  }

  @override
  PersTestCampaignLevelService get campaignLevelService =>
      PersTestCampaignLevelService();

  @override
  void incrementTotalPlayedQuestions() {
    if (currentQuestionInfo.isQuestionOpen()) {
      super.incrementTotalPlayedQuestions();
    }
  }

  @override
  State<PersTestQuestionScreen> createState() => PersTestQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 15;
  }
}

class PersTestQuestionScreenState extends State<PersTestQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return widget.persTestGameType.createGamePlayContent(
        context,
        widget.currentQuestionInfo,
        widget.gameContext,
        widget.gameScreenManagerState);
  }
}
