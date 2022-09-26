import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

import '../Base/question_parser.dart';
import 'hangman_service.dart';

class HangmanQuestionParser extends QuestionParser {
  final HangmanService _hangmanService = HangmanService();

  static final HangmanQuestionParser singleton =
      HangmanQuestionParser.internal();

  factory HangmanQuestionParser() {
    return singleton;
  }

  HangmanQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    return _hangmanService
        .getNormalizedWordLetters(question.questionToBeDisplayed)
        .toList();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.trim();
  }
}
