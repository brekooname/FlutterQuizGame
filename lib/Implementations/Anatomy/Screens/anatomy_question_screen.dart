import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class AnatomyQuestionScreen
    extends GameScreen<AnatomyGameContext, AnatomyScreenManagerState> {
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
            key: key);

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
    return Container();
  }

  void setStateCallback() {
    setState(() {});
  }
}
