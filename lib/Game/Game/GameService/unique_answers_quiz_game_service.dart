import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/GameService/quiz_game_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Util/list_util.dart';

import '../game_user.dart';
import 'game_service.dart';

abstract class UniqueAnswersQuizGameService extends QuizGameService {
  @override
  List<String> getAnswers(Question question) {
    List<String> answers = [];
    List<String> answersIdsArray = getCorrectAnswerIds(question);
    List<String> answerOptionsArray = getAnswerOptionsArray(question);
    for (String answerId in answersIdsArray) {
      answers.add(answerOptionsArray[int.parse(answerId)]);
    }
    answers.shuffle();
    return answers;
  }

  @override
  String getRandomUnpressedAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    return getUnpressedCorrectAnswers(question, pressedAnswers).first;
  }

  @override
  List<String> getAllAnswerOptions(Question question) {
    List<String> answerOptions = [];
    for (String answer in getAnswerOptionsArray(question)) {
      answerOptions.add(answer.trim());
    }
    answerOptions.shuffle();
    return answerOptions;
  }

  List<String> getCorrectAnswerIds(Question question) {
    return question.rawString.split(":")[3].split(",");
  }

  List<String> getAnswerOptionsArray(Question question) {
    return question.rawString.split(":")[2].split("##");
  }
}
