import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_report.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class PersTestGameOverScreen
    extends StandardScreen<PersTestGameScreenManagerState> {
  late final PersTestGameTypeReport persTestGameTypeReport;
  final QuestionDifficulty difficulty;
  final QuestionCategory category;

  PersTestGameOverScreen(
    PersTestGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required this.difficulty,
    required this.category,
  }) : super(gameScreenManagerState, key: key) {
    var campaignLevel =
        PersTestCampaignLevelService().campaignLevel(difficulty, category);
    persTestGameTypeReport =
        PersTestGameTypeReport.createGameTypeReport(campaignLevel);
  }

  @override
  State<PersTestGameOverScreen> createState() => PersTestGameOverScreenState();
}

class PersTestGameOverScreenState extends State<PersTestGameOverScreen>
    with ScreenState {
  
  @override
  Widget build(BuildContext context) {
    return widget.persTestGameTypeReport.createResultsReportContent(context);
  }
}
