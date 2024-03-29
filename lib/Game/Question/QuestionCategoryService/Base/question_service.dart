import 'package:flutter_app_quiz_game/Game/Game/game_user.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';

import '../../../../main.dart';

abstract class QuestionService {
  String getQuestionToBeDisplayed(Question question);

  List<String> getCorrectAnswers(Question question);

  String getRandomUnpressedCorrectAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getCorrectAnswers(question);
    answers.shuffle();
    return answers.first;
  }

  Set<String> getQuizAnswerOptions(Question question);

  Set<String> getQuizAnswerOptionsWithSingleCorrectAnswer(
      String correctAnswer, Question question) {
    return getQuizAnswerOptions(question);
  }

  int getPrefixCodeForQuestion(Question question) {
    return 0;
  }

  String getPrefixToBeDisplayedForQuestion(Question question) {
    return MyApp.appId.gameConfig.gameQuestionConfig
        .getPrefixToBeDisplayedForQuestion(question.category,
            question.difficulty, getPrefixCodeForQuestion(question));
  }

  String getQuestionExplanation(Question question) {
    return "";
  }

  bool addAnswerToGameInfo(
      GameUser gameUser, Question question, String answer) {
    return gameUser.addAnswerToQuestionInfo(question, answer);
  }

  List<String> createWrongAnswerList(QuestionInfo questionInfo,
      List<String> allAnswers, List<String> correctAnswers) {
    List<String> newAllAnswersList =
        allAnswers.map((e) => e.toLowerCase()).toList();
    newAllAnswersList.shuffle();
    newAllAnswersList.removeAll(
        questionInfo.pressedAnswers.map((e) => e.toLowerCase()).toList());
    newAllAnswersList
        .removeAll(correctAnswers.map((e) => e.toLowerCase()).toList());
    return newAllAnswersList;
  }

  bool isAnswerCorrectInQuestion(List<String> correctAnswers, String answer) {
    return isAnswerCorrectInOptionsList(correctAnswers, answer);
  }

  bool isAnswerCorrectInOptionsList(
      List<String> correctAnswers, String answer) {
    return correctAnswers
        .map((e) => e.toLowerCase())
        .contains(answer.toLowerCase());
  }

  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    List<String> answers =
        getCorrectAnswers(question).map((e) => e.toLowerCase()).toList();
    answers.removeAll(pressedAnswers.map((e) => e.toLowerCase()).toList());
    return answers;
  }

  int getNrOfWrongAnswersPressed(
      Question question, Set<String> pressedAnswers) {
    return 0;
  }

  bool isGameFinished(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return isGameFinishedSuccessful(correctAnswers, pressedAnswers) ||
        isGameFinishedFailed(correctAnswers, pressedAnswers);
  }

  bool isGameFinishedSuccessful(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    var isGameFinishedFailedBool =
        isGameFinishedFailed(correctAnswers, pressedAnswers);
    return !isGameFinishedFailedBool &&
        pressedAnswers
            .map((e) => e.toLowerCase())
            .toSet()
            .containsAll(correctAnswers.map((e) => e.toLowerCase()).toSet());
  }

  bool isGameFinishedFailed(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return pressedAnswers
        .where(
            (element) => !isAnswerCorrectInOptionsList(correctAnswers, element))
        .isNotEmpty;
  }

  void processNewQuestionInfo(
      GameUser gameUser, QuestionInfo gameQuestionInfo) {}
}
