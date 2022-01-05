import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/quiz_hangman_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class GeoQuizHangmanScreen extends GameScreen<GeoQuizGameContext>
    with QuizHangmanGameScreen<GeoQuizGameContext> {
  static final int show_interstitial_ad_every_n_questions = 8;

  GeoQuizHangmanScreen(GameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required GeoQuizGameContext gameContext,
  }) : super(gameScreenManagerState, GeoQuizCampaignLevelService(), gameContext,
      difficulty, category,
      key: key) {
    initQuizHangmanScreen(
        gameContext, GeoQuizLocalStorage(), difficulty, category);
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return show_interstitial_ad_every_n_questions;
  }

  @override
  State<GeoQuizHangmanScreen> createState() => GeoQuizHangmanScreenState();
}

class GeoQuizHangmanScreenState extends State<GeoQuizHangmanScreen>
    with ScreenState {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      widget.onHintButtonClick(setStateCallback);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentQuestionInfo != null) {
      Widget wordContainer = widget.getHangmanWordContainer();
      Widget letters = widget.createLettersRows(
          setStateCallback,
          widget.goToNextGameScreenCallBack(context)
      );
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[wordContainer, letters],
      );
    } else {
      return Container();
    }
  }

  void setStateCallback() {
    setState(() {});
  }
}
