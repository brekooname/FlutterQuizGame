import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class AstronomyQuestionScreen
    extends GameScreen<AstronomyGameContext, AstronomyScreenManagerState>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  AstronomyQuestionScreen(
    AstronomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AstronomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AstronomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
            gameContext, currentQuestionInfo, AstronomyLocalStorage()),
        currentQuestionInfo);
  }

  @override
  State<AstronomyQuestionScreen> createState() => AstronomyQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class AstronomyQuestionScreenState extends State<AstronomyQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void setStateCallback() {
    setState(() {});
  }
}
