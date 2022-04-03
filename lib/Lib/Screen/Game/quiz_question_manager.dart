import 'dart:collection';
import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class QuizQuestionManager<TGameContext extends GameContext,
    TQuizGameLocalStorage extends QuizGameLocalStorage> {
  final MyAudioPlayer _audioPlayer = MyAudioPlayer();
  final TGameContext gameContext;
  final QuestionInfo _currentQuestionInfo;
  final TQuizGameLocalStorage quizGameLocalStorage;
  final Set<String> wrongPressedAnswer = HashSet();
  final Set<String> hintDisabledPossibleAnswers = HashSet();
  late List<String> correctAnswersForQuestion;
  late Set<String> possibleAnswers;

  QuizQuestionManager(
      this.gameContext, this._currentQuestionInfo, this.quizGameLocalStorage) {
    var question = _currentQuestionInfo.question;
    var questionService = question.questionService;
    correctAnswersForQuestion = questionService
        .getCorrectAnswers(question)
        .map((e) => e.capitalized)
        .toList();

    possibleAnswers = HashSet.of(
        _getPossibleAnswerOption().map((e) => e.capitalized).toList());
  }

  void onClickAnswerOptionBtn(Question question, String answerBtnText,
      VoidCallback refreshSetState, VoidCallback goToNextScreenAfterPress) {
    gameContext.gameUser.addAnswerToQuestionInfo(question, answerBtnText);
    if (isAnswerCorrectInOptionsList(question, answerBtnText)) {
      executeOnPressedCorrectAnswer();
    } else {
      executeOnPressedWrongAnswer(answerBtnText);
    }
    refreshSetState.call();
    _processGameFinished(question, goToNextScreenAfterPress);
  }

  bool isAnswerCorrectInOptionsList(Question question, String answerBtnText) {
    return question.questionService
        .isAnswerCorrectInOptionsList(correctAnswersForQuestion, answerBtnText);
  }

  void executeOnPressedCorrectAnswer() {
    playSuccessAudio();
  }

  void playSuccessAudio() => _audioPlayer.playSuccess();

  void executeOnPressedWrongAnswer(String answerBtnText) {
    _audioPlayer.playFail();
    wrongPressedAnswer.add(answerBtnText);
  }

  void _processGameFinished(
      Question question, VoidCallback goToNextScreenAfterPress) {
    var questionService = question.questionService;
    if (isGameFinished()) {
      Future.delayed(
          durationGoToNextScreen, () => goToNextScreenAfterPress.call());
      if (isGameFinishedSuccessful()) {
        gameContext.gameUser.setWonQuestion(_currentQuestionInfo);
        quizGameLocalStorage.setWonQuestion(question);
      } else if (questionService.isGameFinishedFailedWithOptionList(
          correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers)) {
        gameContext.gameUser.setLostQuestion(_currentQuestionInfo);
        quizGameLocalStorage.setLostQuestion(question);
      }
    }
  }

  Duration get durationGoToNextScreen => Duration(
      milliseconds:
          getValueBasedOnNrOfPossibleAnswers(1100, 1600, 1700, 1800, false, 1));

  bool isGameFinishedSuccessful() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedSuccessfulWithOptionList(
            correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  bool isGameFinishedFailed() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedFailedWithOptionList(
            correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  bool isGameFinished() {
    return _currentQuestionInfo.question.questionService
        .isGameFinishedWithOptionList(
            correctAnswersForQuestion, _currentQuestionInfo.pressedAnswers);
  }

  void onHintButtonClick(VoidCallback refreshSetState) {
    gameContext.amountAvailableHints--;
    quizGameLocalStorage.setRemainingHints(
        _currentQuestionInfo.question.difficulty,
        gameContext.amountAvailableHints);

    var optionsToDisable = List.of(possibleAnswers);
    optionsToDisable.shuffle();
    optionsToDisable.removeAll(correctAnswersForQuestion);

    hintDisabledPossibleAnswers.add(optionsToDisable.first.toLowerCase());
    hintDisabledPossibleAnswers.add(optionsToDisable.last.toLowerCase());

    refreshSetState.call();
  }

  List<String> _getPossibleAnswerOption() {
    List<String> possibleAnswers;
    var question = _currentQuestionInfo.question;
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
