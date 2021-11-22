import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Util/list_util.dart';

import '../game_user.dart';
import 'game_service.dart';

abstract class QuizGameService extends GameService {
  List<String> getAnswers(Question question);

  List<String> getAllAnswerOptions(Question question);

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return compareAnswerStrings(
        answer.toLowerCase(), getAnswers(question).first.toLowerCase());
  }

  @override
  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getAnswers(question);
    return ListUtil.removeAll(answers, pressedAnswers);
  }

  @override
  int getImageToBeDisplayedPositionInString() {
    return 4;
  }

  @override
  int getQuestionToBeDisplayedPositionInString() {
    return 1;
  }

  @override
  int getNrOfWrongAnswersPressed(Set<String> pressedAnswers) {
    return 0;
  }

  @override
  bool isGameFinishedSuccessful(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  bool isGameFinishedFailed(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        !isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }
}
