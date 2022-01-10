import 'dart:collection';
import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';

class QuestionInfo {
  late Question question;
  final Set<String> _pressedAnswers = HashSet<String>();
  QuestionInfoStatus _status = QuestionInfoStatus.OPEN;
  DateTime? questionAnsweredAt;

  QuestionInfo(this.question);

  void addPressedAnswer(String answerId) {
    _pressedAnswers.add(answerId);
  }

  QuestionInfoStatus get status => _status;

  Iterable<String> get pressedAnswers => _pressedAnswers;

  void clearPressedAnswers() {
    _pressedAnswers.clear();
  }

  void updateStatus(QuestionInfoStatus questionInfoStatus) {
    if (questionInfoStatus != QuestionInfoStatus.OPEN) {
      questionAnsweredAt = DateTime.now();
    }
    _status = questionInfoStatus;
  }

  bool isQuestionOpen() {
    return status == QuestionInfoStatus.OPEN;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionInfo &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          _status == other._status;

  @override
  int get hashCode => question.hashCode ^ _status.hashCode;

  @override
  String toString() {
    return 'QuestionInfo{question: $question, _status: $_status, pressedAnswers: $pressedAnswers}';
  }
}
