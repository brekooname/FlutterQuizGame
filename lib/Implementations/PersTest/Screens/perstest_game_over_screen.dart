import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_play.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class PersTestGameOverScreen
    extends StandardScreen<PersTestGameScreenManagerState> {
  late PersTestGameTypePlay persTestGameType;
  QuestionDifficulty difficulty;
  QuestionCategory category;

  PersTestGameOverScreen(
    PersTestGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required this.difficulty,
    required this.category,
  }) : super(gameScreenManagerState, key: key) {
    var campaignLevel =
        PersTestCampaignLevelService().campaignLevel(difficulty, category);
    persTestGameType = PersTestGameTypePlay.createGameType(campaignLevel);
  }

  @override
  State<PersTestGameOverScreen> createState() => PersTestGameOverScreenState();
}

class PersTestGameOverScreenState extends State<PersTestGameOverScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return widget.persTestGameType.createResultsReportContent(context);
  }
}
