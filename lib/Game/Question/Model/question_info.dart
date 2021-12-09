import 'dart:collection';
import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';

class QuestionInfo {
  late Question question;
  QuestionInfoStatus status = QuestionInfoStatus.OPEN;
  HashSet<String> answers = HashSet<String>();

  QuestionInfo({required Question question}) {
    this.question = question;
  }

  void addAnswer(String answerId) {
    answers.add(answerId);
  }

  bool isQuestionOpen() {
    return status == QuestionInfoStatus.OPEN;
  }

  @override
  String toString() {
    return "GameQuestionInfo{" +
        "question=" +
        question.toString() +
        ", answers=" +
        answers.toString() +
        '}';
  }
}
