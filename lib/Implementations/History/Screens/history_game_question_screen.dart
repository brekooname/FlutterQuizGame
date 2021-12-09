import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/game_finished_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class HistoryGameQuestionScreen extends StatefulWidget with GameScreen {
  GameContext gameContext;
  late HistoryLocalStorage historyLocalStorage;
  late QuestionInfo currentQuestion;

  bool correctAnswerPressed = false;

  HistoryGameQuestionScreen(
      {Key? key,
      required QuestionDifficulty difficulty,
      required QuestionCategory category,
      required this.gameContext})
      : super(key: key) {
    initScreen(HistoryCampaignLevel(), difficulty, category);
    historyLocalStorage = HistoryLocalStorage();

    currentQuestion =
        gameContext.gameUser.getRandomQuestion(difficulty, category);
  }

  @override
  State<HistoryGameQuestionScreen> createState() =>
      HistoryGameQuestionScreenState();
}

class HistoryGameQuestionScreenState extends State<HistoryGameQuestionScreen>
    with StandardScreen {
  @override
  Widget build(BuildContext context) {
    initScreen(context);

    return createScreen(Container());
  }

  String getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  GameFinishedPopup buildGameFinishedPopup(BuildContext context) {
    return GameFinishedPopup(
      isGameFinishedSuccess: true,
      highScore: null,
      playAgainClick: () {},
    );
  }

  void onHintButtonClick(List<int> levelsWon, List<int> levelsLost) {
    widget.correctAnswerPressed = false;

    widget.gameContext.amountAvailableHints =
        widget.gameContext.amountAvailableHints - 1;

    setState(() {});
  }

  @override
  void dispose() {
    disposeScreen();
    super.dispose();
  }
}
