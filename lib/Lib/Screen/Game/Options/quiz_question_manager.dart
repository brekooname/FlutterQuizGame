import 'dart:collection';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../../Game/Constants/hint_button_type.dart';
import '../../../../Game/Question/QuestionCategoryService/ImageClick/image_click_question_service.dart';

class QuizQuestionManager<TGameContext extends GameContext,
    TQuizGameLocalStorage extends QuizGameLocalStorage> {
  final MyAudioPlayer audioPlayer = MyAudioPlayer();
  final TGameContext gameContext;
  final QuestionInfo currentQuestionInfo;
  final TQuizGameLocalStorage quizGameLocalStorage;
  final Set<String> hintDisabledPossibleAnswers = HashSet();

  late List<String> correctAnswersForQuestion;
  late Set<String> possibleAnswers;

  QuizQuestionManager(
      this.gameContext, this.currentQuestionInfo, this.quizGameLocalStorage) {
    var question = currentQuestionInfo.question;
    var questionService = question.questionService;
    correctAnswersForQuestion = questionService
        .getCorrectAnswers(question)
        .map((e) => e.capitalized)
        .toList();

    possibleAnswers = HashSet.of(
        _getPossibleAnswerOption().map((e) => e.capitalized).toList());
  }

  void onClickAnswerOptionBtn(String answerBtnText,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    var question = currentQuestionInfo.question;
    gameContext.gameUser.addAnswerToQuestionInfo(question, answerBtnText);
    if (isAnswerCorrectInOptionsList(answerBtnText)) {
      executeOnPressedCorrectAnswer();
    } else {
      executeOnPressedWrongAnswer();
    }
    refreshSetState.call();
    _processGameFinished(goToNextScreenAfterPress);
  }

  bool isAnswerCorrectInOptionsList(String answerBtnText) {
    return currentQuestionInfo.question.questionService
        .isAnswerCorrectInOptionsList(correctAnswersForQuestion, answerBtnText);
  }

  Set<String> get correctPressedAnswer {
    Set<String> pressedAnswers = _getPressedAnswersToLower();
    pressedAnswers.retainWhere((e) => _correctAnswersContainPressedAnswer(e));
    return pressedAnswers;
  }

  Set<String> get wrongPressedAnswer {
    Set<String> pressedAnswers = _getPressedAnswersToLower();
    pressedAnswers.removeWhere((e) => _correctAnswersContainPressedAnswer(e));
    return pressedAnswers;
  }

  Set<String> get allPressedAnswer {
    return _getPressedAnswersToLower();
  }

  bool _correctAnswersContainPressedAnswer(String pressedAnswer) =>
      correctAnswersForQuestion
          .map((e) => e.toLowerCase())
          .contains(pressedAnswer.toLowerCase());

  Set<String> _getPressedAnswersToLower() {
    return currentQuestionInfo.pressedAnswers
        .map((e) => e.toLowerCase())
        .toSet();
  }

  void executeOnPressedCorrectAnswer() => playSuccessAudio();

  void playSuccessAudio() => audioPlayer.playSuccess();

  void executeOnPressedWrongAnswer() => audioPlayer.playFail();

  void _processGameFinished(VoidCallback goToNextScreenAfterPress) {
    var question = currentQuestionInfo.question;
    var questionService = question.questionService;
    if (isGameFinished()) {
      Future.delayed(
          durationGoToNextScreen(
              //because image click questions don't have any text
              //we don't need to wait much time to go to the next screen
              defaultAllDurationValue:
                  questionService is ImageClickQuestionService ? 1100 : null),
          () {
        goToNextScreenAfterPress.call();
      });
      if (isGameFinishedSuccessful()) {
        gameContext.gameUser.setWonQuestion(currentQuestionInfo);
        quizGameLocalStorage.setWonQuestion(question);
      } else if (questionService.isGameFinishedFailed(
          correctAnswersForQuestion, currentQuestionInfo.pressedAnswers)) {
        gameContext.gameUser.setLostQuestion(currentQuestionInfo);
        quizGameLocalStorage.setLostQuestion(question);
      }
    }
  }

  Duration durationGoToNextScreen({int? defaultAllDurationValue}) => Duration(
      milliseconds: getValueBasedOnNrOfPossibleAnswers(
          defaultAllDurationValue ?? 1100,
          defaultAllDurationValue ?? 1600,
          defaultAllDurationValue ?? 1700,
          defaultAllDurationValue ?? 1800,
          false,
          1));

  bool isGameFinishedSuccessful() {
    return currentQuestionInfo.question.questionService
        .isGameFinishedSuccessful(
            correctAnswersForQuestion, currentQuestionInfo.pressedAnswers);
  }

  bool isGameFinishedFailed() {
    return currentQuestionInfo.question.questionService.isGameFinishedFailed(
        correctAnswersForQuestion, currentQuestionInfo.pressedAnswers);
  }

  bool isGameFinished() {
    return currentQuestionInfo.question.questionService.isGameFinished(
        correctAnswersForQuestion, currentQuestionInfo.pressedAnswers);
  }

  void onHintButtonClickForCatDiff(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    _decreaseAvailableHints();

    quizGameLocalStorage.setRemainingHintsForCatDiff(
        currentQuestionInfo.question.category,
        currentQuestionInfo.question.difficulty,
        gameContext.amountAvailableHints);

    _onHintButtonUpdateControls(refreshSetState, goToNextScreenAfterPress);
  }

  void onHintButtonClickForDiff(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    _decreaseAvailableHints();

    quizGameLocalStorage.setRemainingHintsForDiff(
        currentQuestionInfo.question.difficulty,
        gameContext.amountAvailableHints);

    _onHintButtonUpdateControls(refreshSetState, goToNextScreenAfterPress);
  }

  void _decreaseAvailableHints() {
    gameContext.amountAvailableHints--;
  }

  void _onHintButtonUpdateControls(
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    var hintButtonType = currentQuestionInfo.question.category
        .getQuestionCategoryService(currentQuestionInfo.question.difficulty)
        .getHintButtonType();
    if (hintButtonType == HintButtonType.hintDisableTwoAnswers) {
      var optionsToDisable = List.of(possibleAnswers);
      optionsToDisable.shuffle();
      optionsToDisable.removeAll(correctAnswersForQuestion);

      hintDisabledPossibleAnswers.add(optionsToDisable.first.toLowerCase());
      if (optionsToDisable.length > 2) {
        hintDisabledPossibleAnswers.add(optionsToDisable.last.toLowerCase());
      }

      refreshSetState.call();
    } else if (hintButtonType == HintButtonType.hintPressRandomAnswer) {
      var optionsToDisable =
          correctAnswersForQuestion.map((e) => e.toLowerCase()).toList();
      optionsToDisable.shuffle();
      optionsToDisable.removeAll(allPressedAnswer);

      var answerToPress = optionsToDisable.first.toLowerCase();

      hintDisabledPossibleAnswers.add(answerToPress);

      gameContext.gameUser
          .addAnswerToQuestionInfo(currentQuestionInfo.question, answerToPress);

      refreshSetState.call();

      _processGameFinished(goToNextScreenAfterPress);
    }
  }

  List<String> _getPossibleAnswerOption() {
    List<String> possibleAnswers;
    var question = currentQuestionInfo.question;
    var questionService = question.questionService;
    possibleAnswers = List.of(questionService.getQuizAnswerOptions(question));
    possibleAnswers.shuffle();
    return possibleAnswers;
  }

  int getValueBasedOnNrOfPossibleAnswers(
      int v4, int v6, int v8, int max, bool isSizeValue, int factor) {
    var nrOfPossibleAnswers = possibleAnswers.length;
    int val = nrOfPossibleAnswers <= 4
        ? v4
        : nrOfPossibleAnswers <= 6
            ? v6
            : nrOfPossibleAnswers <= 8
                ? v8
                : max;
    val = (val * factor).ceil();
    val = isSizeValue
        ? val > v4
            ? v4
            : val
        : val;
    return val;
  }
}
