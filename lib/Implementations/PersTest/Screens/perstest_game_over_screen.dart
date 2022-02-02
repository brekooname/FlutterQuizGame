
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

import 'GameType/perstest_game_type.dart';
import 'GameType/perstest_game_type_bigfive.dart';

class PersTestGameOverScreen
    extends StandardScreen<PersTestGameScreenManagerState> {
  late PersTestGameType persTestGameType;
  PersTestGameContext gameContext;
  QuestionDifficulty difficulty;
  QuestionCategory category;

  PersTestGameOverScreen(
    PersTestGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required this.difficulty,
    required this.category,
    required this.gameContext,
  }) : super(gameScreenManagerState, key: key) {
    var questionConfig = PersTestGameQuestionConfig();
    var campaignLevel =
        PersTestCampaignLevelService().campaignLevel(difficulty, category);
    if (category == questionConfig.cat0) {
      persTestGameType = PersTestGameTypeBigFive(campaignLevel,
          gameContext.currentQuestionInfo, gameContext, gameScreenManagerState);
    }
  }

  @override
  State<PersTestGameOverScreen> createState() => PersTestGameOverScreenState();
}

class PersTestGameOverScreenState extends State<PersTestGameOverScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return widget.persTestGameType.createGameOverContent(context);
  }
}
