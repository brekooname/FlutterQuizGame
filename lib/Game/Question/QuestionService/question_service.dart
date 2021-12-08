import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_user.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';

import '../category_difficulty.dart';

abstract class QuestionService {
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
    List<String> split = question.rawString.split(":");
    int imageSplitPos = getImageToBeDisplayedPositionInString();
    if (split.length == imageSplitPos + 1 && split[imageSplitPos] != null) {
      image = Image.asset("img_cat" +
          question.category.index.toString() +
          "_" +
          split[imageSplitPos]);
    }
    return image;
  }

  String getQuestionToBeDisplayed(Question question) {
    String questionString = question.rawString;
    String questionToBeDisplayed = questionString.contains(":")
        ? questionString.split(":")[getQuestionToBeDisplayedPositionInString()]
        : "";
    return questionToBeDisplayed;
  }

  List<String> createWrongAnswerList(QuestionInfo questionInfo,
      List<String> allAnswers, List<String> correctAnswers) {
    List<String> newAllAnswersList = allAnswers;
    newAllAnswersList.shuffle();
    newAllAnswersList.removeAll(questionInfo.answers);
    newAllAnswersList.removeAll(correctAnswers);
    return newAllAnswersList;
  }

  void processNewQuestionInfo(
      GameUser gameUser, QuestionInfo gameQuestionInfo) {}

  int getImageToBeDisplayedPositionInString();

  int getQuestionToBeDisplayedPositionInString();

  bool isGameFinishedSuccessful(Question question, Set<String> pressedAnswers);

  bool isGameFinishedFailed(Question question, Set<String> pressedAnswers);

  int getNrOfWrongAnswersPressed(Set<String> pressedAnswers);

  bool isAnswerCorrectInQuestion(Question question, String answer);

  String getRandomUnpressedAnswerFromQuestion(
      Question question, Set<String> pressedAnswers);

  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
      Question question);

  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers);
}
