import 'dart:collection';
import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';

class QuestionInfo {
  late Question question;
  QuestionInfoStatus _status = QuestionInfoStatus.OPEN;
  HashSet<String> pressedAnswers = HashSet<String>();
  DateTime? questionAnsweredAt;

  QuestionInfo(this.question);

  void addPressedAnswer(String answerId) {
    pressedAnswers.add(answerId);
  }

  QuestionInfoStatus get status => _status;

  set status(QuestionInfoStatus questionInfoStatus) {
    if (_status != QuestionInfoStatus.OPEN) {
      questionAnsweredAt = DateTime.now();
    } else {
      questionAnsweredAt = null;
    }
    _status = questionInfoStatus;
  }

  bool isQuestionOpen() {
    return status == QuestionInfoStatus.OPEN;
  }

  @override
  String toString() {
    return 'QuestionInfo{question: $question, _status: $_status, pressedAnswers: $pressedAnswers}';
  }
}
