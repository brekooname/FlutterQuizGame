import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Components/dopewars_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class DopeWarsQuestionScreen
    extends GameScreen<DopeWarsContext, DopeWarsScreenManagerState> {
  DopeWarsQuestionScreen(
    DopeWarsScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required DopeWarsContext gameContext,
  }) : super(
            gameScreenManagerState,
            DopeWarsCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key);

  @override
  State<DopeWarsQuestionScreen> createState() => DopeWarsQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class DopeWarsQuestionScreenState extends State<DopeWarsQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [DopeWarsLevelHeader(), const Spacer()]);
  }

  void setStateCallback() {
    setState(() {});
  }
}
