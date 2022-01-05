
import '../question_parser.dart';

class HangmanQuestionParser extends QuestionParser {
  static final HangmanQuestionParser singleton =
      HangmanQuestionParser.internal();

  factory HangmanQuestionParser() {
    return singleton;
  }

  HangmanQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    return [];
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    return questionRawString.trim();
  }

}
