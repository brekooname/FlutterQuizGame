import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

mixin QuizOptionsGameScreen<TGameContext extends GameContext> {
  final ScreenDimensionsService _screenDimensions = ScreenDimensionsService();
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();
  final ImageService _imageService = ImageService();
  late QuestionInfo currentQuestionInfo;
  late QuizGameLocalStorage quizGameLocalStorage;
  late TGameContext gameContext;
  bool correctAnswerPressed = false;
  String? wrongPressedAnswer;
  Set<String> hintDisabledPossibleAnswers = HashSet();
  Set<String> _possibleAnswers = HashSet();

  void initQuizOptionsScreen(
      TGameContext gameContext,
      QuizGameLocalStorage quizGameLocalStorage,
      QuestionDifficulty difficulty,
      QuestionCategory category) {
    this.quizGameLocalStorage = quizGameLocalStorage;
    this.gameContext = gameContext;
    currentQuestionInfo =
        gameContext.gameUser.getRandomQuestion(difficulty, category);

    var questionService = currentQuestionInfo.question.questionService;
    var list = List.of(questionService
        .getAllAnswerOptionsForQuestion(currentQuestionInfo.question));
    list.shuffle();
    _possibleAnswers = HashSet.of(list);
  }

  Widget createOptionRows(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    List<Row> answerRows = [];
    int answersOnRow = 2;
    List<Widget> answerBtns = [];
    for (String possibleAnswer in _possibleAnswers) {
      answerBtns.add(createPossibleAnswerButton(
          refreshSetState, goToNextScreenAfterPress, possibleAnswer));
      if (answerBtns.length == answersOnRow) {
        answerRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: answerBtns,
        ));
        answerBtns = [];
      }
    }
    answerRows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: answerBtns,
    ));
    Widget btnContainer = Expanded(
        child: Column(
      children: answerRows,
    ));

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        createImageContainer(currentQuestionInfo.question),
        btnContainer
      ],
    ));
  }

  Widget createImageContainer(Question question) {
    return Expanded(
        child: Container(
            child: _imageService.getSpecificImage(
                module: getQuestionImagePath(
                    question.difficulty, question.category),
                imageExtension: "jpeg",
                imageName: "i" + question.index.toString())));
  }

  String getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  Widget createPossibleAnswerButton(VoidCallback refreshSetState,
      VoidCallback goToNextScreenAfterPress, String answerBtnText) {
    var btnBackgr = Colors.lightBlueAccent;
    var btnSize = Size(_screenDimensions.w(45), _screenDimensions.h(15));
    var disabled = wrongPressedAnswer != null ||
        correctAnswerPressed ||
        hintDisabledPossibleAnswers.contains(answerBtnText.toLowerCase());

    var disabledBackgroundColor = wrongPressedAnswer != null &&
            wrongPressedAnswer!.toLowerCase() == answerBtnText.toLowerCase()
        ? Colors.red
        : answerBtnText.toLowerCase() ==
                currentQuestionInfo.question.correctAnswer.toLowerCase()
            ? Colors.green
            : null;

    return Padding(
        padding: EdgeInsets.all(_screenDimensions.w(1)),
        child: MyButton(
            size: btnSize,
            disabled: disabled,
            disabledBackgroundColor: disabledBackgroundColor,
            onClick: () {
              if (currentQuestionInfo.question.questionService
                  .isAnswerCorrectInQuestion(
                      currentQuestionInfo.question, answerBtnText)) {
                _audioPlayer.playSuccess();
                correctAnswerPressed = true;
                gameContext.gameUser.setWonQuestion(currentQuestionInfo);
                quizGameLocalStorage
                    .setWonQuestion(currentQuestionInfo.question);
              } else {
                _audioPlayer.playFail();
                wrongPressedAnswer = answerBtnText;
                correctAnswerPressed = false;
                gameContext.gameUser.setLostQuestion(currentQuestionInfo);
                quizGameLocalStorage
                    .setLostQuestion(currentQuestionInfo.question);
              }
              refreshSetState.call();
              Future.delayed(const Duration(milliseconds: 1100),
                  () => goToNextScreenAfterPress.call());
            },
            buttonSkinConfig: ButtonSkinConfig(
                borderColor: ColorUtil.colorDarken(btnBackgr, 0.1),
                backgroundColor: btnBackgr),
            customContent: MyText(
              text: answerBtnText,
              maxLines: 4,
              width: btnSize.width / 1.1,
            )));
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    gameContext.amountAvailableHints--;
    quizGameLocalStorage.setRemainingHints(
        currentQuestionInfo.question.difficulty,
        gameContext.amountAvailableHints);

    var optionsToDisable = List.of(_possibleAnswers);
    optionsToDisable.shuffle();
    optionsToDisable.remove(currentQuestionInfo.question.correctAnswer);

    hintDisabledPossibleAnswers.add(optionsToDisable.first.toLowerCase());
    hintDisabledPossibleAnswers.add(optionsToDisable.last.toLowerCase());

    refreshSetState.call();
  }
}
