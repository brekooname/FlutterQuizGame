import 'package:flutter/material.dart';
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
        .getPrefixToBeDisplayedForQuestion(
            question.category, getPrefixCodeForQuestion(question));
  }

  bool addAnswerToGameInfo(
      GameUser gameUser, Question question, String answer) {
    return gameUser.addAnswerToQuestionInfo(question, answer);
  }

  Image? getQuestionImage(Question question) {
    Image? image;
    if (false) {
      image = Image.asset("img_cat" +
          question.category.index.toString() +
          "_" +
          question.index.toString());
    }
    return image;
  }

  List<String> createWrongAnswerList(QuestionInfo questionInfo,
      List<String> allAnswers, List<String> correctAnswers) {
    List<String> newAllAnswersList = allAnswers;
    newAllAnswersList.shuffle();
    newAllAnswersList.removeAll(questionInfo.pressedAnswers);
    newAllAnswersList.removeAll(correctAnswers);
    return newAllAnswersList;
  }

  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return isAnswerCorrectInOptionsList(getCorrectAnswers(question), answer);
  }

  bool isAnswerCorrectInOptionsList(
      List<String> correctAnswers, String answer) {
    return correctAnswers
        .map((e) => e.toLowerCase())
        .contains(answer.toLowerCase());
  }

  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getCorrectAnswers(question);
    answers.removeAll(pressedAnswers);
    return answers;
  }

  int getNrOfWrongAnswersPressed(
      Question question, Set<String> pressedAnswers) {
    return 0;
  }

  bool isGameFinished(Question question, Set<String> pressedAnswers) {
    return isGameFinishedWithOptionList(
        getCorrectAnswers(question), pressedAnswers);
  }

  bool isGameFinishedWithOptionList(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return isGameFinishedSuccessfulWithOptionList(
            correctAnswers, pressedAnswers) ||
        isGameFinishedFailedWithOptionList(correctAnswers, pressedAnswers);
  }

  bool isGameFinishedSuccessful(
      Question question, Iterable<String> pressedAnswers) {
    return isGameFinishedSuccessfulWithOptionList(
        getCorrectAnswers(question), pressedAnswers);
  }

  bool isGameFinishedSuccessfulWithOptionList(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return !isGameFinishedFailedWithOptionList(
            correctAnswers, pressedAnswers) &&
        pressedAnswers.toSet().containsAll(correctAnswers);
  }

  bool isGameFinishedFailed(
      Question question, Iterable<String> pressedAnswers) {
    return isGameFinishedFailedWithOptionList(
        getCorrectAnswers(question), pressedAnswers);
  }

  bool isGameFinishedFailedWithOptionList(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return pressedAnswers
        .where(
            (element) => !isAnswerCorrectInOptionsList(correctAnswers, element))
        .isNotEmpty;
  }

  void processNewQuestionInfo(
      GameUser gameUser, QuestionInfo gameQuestionInfo) {}
}
