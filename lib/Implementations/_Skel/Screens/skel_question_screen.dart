import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Constants/skel_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Questions/skel_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Service/skel_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Service/skel_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class SkelQuestionScreen extends GameScreen<
    SkelGameContext,
    SkelScreenManagerState,
    SkelCampaignLevelService> with QuizOptionsGameScreen<QuizQuestionManager> {
  SkelQuestionScreen(
    SkelScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required SkelGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            SkelCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<SkelGameContext, SkelLocalStorage>(
            gameContext, currentQuestionInfo, SkelLocalStorage()),
        currentQuestionInfo);
  }

  @override
  State<SkelQuestionScreen> createState() => SkelQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class SkelQuestionScreenState extends State<SkelQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void setStateCallback() {
    setState(() {});
  }
}
