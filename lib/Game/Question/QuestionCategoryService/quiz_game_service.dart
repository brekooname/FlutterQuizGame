import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';

import 'question_service.dart';

abstract class QuizQuestionService extends QuestionService {
  List<String> getAnswers(Question question);

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return compareAnswerStrings(
        answer.toLowerCase(), getAnswers(question).first.toLowerCase());
  }

  @override
  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getAnswers(question);
    answers.removeAll(pressedAnswers);
    return answers;
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
