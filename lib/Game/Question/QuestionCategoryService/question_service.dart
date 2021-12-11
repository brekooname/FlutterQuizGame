import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_user.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import '../../../main.dart';

abstract class QuestionService {
  String getQuestionToBeDisplayed(Question question);

  List<String> getCorrectAnswers(Question question);

  String getRandomUnpressedCorrectAnswerFromQuestion(
      Question question, Set<String> pressedAnswers);

  Set<String> getAllAnswerOptionsForQuestion(Question question);

  int getPrefixCodeForQuestion(Question question) {
    return 0;
  }

  String getPrefixToBeDisplayedForQuestion(Question question) {
    return MyApp.appId.gameConfig.gameQuestionConfig.prefixLabelForCode
            .get<QuestionCategoryWithPrefixCode, String>(
                QuestionCategoryWithPrefixCode(
                    question.category, getPrefixCodeForQuestion(question))) ??
        "";
  }

  String getCorrectAnswer(Question question) {
    return getCorrectAnswers(question).first;
  }

  bool addAnswerToGameInfo(
      GameUser gameUser, Question question, String answer) {
    return gameUser.addAnswerToQuestionInfo(question, answer);
  }

  bool compareAnswerStrings(String answer1, String answer2) {
    return answer1 == answer2;
  }

  bool isGameFinished(Question question, Set<String> pressedAnswers) {
    return isGameFinishedSuccessful(question, pressedAnswers) ||
        isGameFinishedFailed(question, pressedAnswers);
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
    return compareAnswerStrings(
        answer.toLowerCase(), getCorrectAnswers(question).first.toLowerCase());
  }

  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getCorrectAnswers(question);
    answers.removeAll(pressedAnswers);
    return answers;
  }

  int getNrOfWrongAnswersPressed(Set<String> pressedAnswers) {
    return 0;
  }

  bool isGameFinishedSuccessful(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  bool isGameFinishedFailed(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        !isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  void processNewQuestionInfo(
      GameUser gameUser, QuestionInfo gameQuestionInfo) {}
}
