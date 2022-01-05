import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';


class GeoQuizHangmanScreen extends GameScreen<HistoryGameContext>
    with QuizOptionsGameScreen<HistoryGameContext>, QuizQuestionGameScreen {
  GeoQuizHangmanScreen(
    GameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required HistoryGameContext gameContext,
  }) : super(gameScreenManagerState, HistoryCampaignLevelService(), gameContext,
            difficulty, category,
            key: key) {
    initQuizOptionsScreen(
        gameContext, HistoryLocalStorage(), difficulty, category);
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
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
      Widget questionContainer = widget.createQuestionTextContainer(
          widget.currentQuestionInfo!.question, 2, 4, null);
      Widget optionsRows = widget.createOptionRows(
        setStateCallback,
        () {
          widget.goToNextGameScreen(context);
        },
      );
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[questionContainer, optionsRows],
      );
    } else {
      return Container();
    }
  }

  void setStateCallback() {
    setState(() {});
  }
}
