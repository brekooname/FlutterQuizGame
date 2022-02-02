import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_bigfive.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import 'GameType/perstest_game_type.dart';

class PersTestQuestionScreen
    extends GameScreen<PersTestGameContext, PersTestGameScreenManagerState> {
  late PersTestGameType persTestGameType;

  PersTestQuestionScreen(
    PersTestGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required PersTestGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            PersTestCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.currentQuestionInfo],
            key: key) {
    var questionConfig = PersTestGameQuestionConfig();
    if (category == questionConfig.cat0) {
      persTestGameType = PersTestGameTypeBigFive(campaignLevel,
          currentQuestionInfo, gameContext, gameScreenManagerState);
    }
  }

  @override
  State<PersTestQuestionScreen> createState() => PersTestQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class PersTestQuestionScreenState extends State<PersTestQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return widget.persTestGameType.createGamePlayContent(context);
  }
}
