import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class HangmanQuestionScreen extends GameScreen<
    HangmanGameContext,
    HangmanScreenManagerState,
    HangmanCampaignLevelService> with QuizOptionsGameScreen<QuizQuestionManager> {
  HangmanQuestionScreen(
    HangmanScreenManagerState gameScreenManagerState, {
    Key? key,
    required HangmanGameContext gameContext,
    required QuestionInfo questionInfo,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key) {
    initQuizOptionsScreen(
        QuizQuestionManager<HangmanGameContext, HangmanLocalStorage>(
            gameContext, currentQuestionInfo, HangmanLocalStorage()),
        currentQuestionInfo);
  }

  @override
  HangmanCampaignLevelService get campaignLevelService =>
      HangmanCampaignLevelService();

  @override
  State<HangmanQuestionScreen> createState() => HangmanQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class HangmanQuestionScreenState extends State<HangmanQuestionScreen>
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
