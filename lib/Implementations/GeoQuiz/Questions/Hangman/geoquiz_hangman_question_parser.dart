
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';

class GeoQuizHangmanQuestionParser extends QuestionParser {

  static final GeoQuizHangmanQuestionParser singleton =
      GeoQuizHangmanQuestionParser.internal();

  factory GeoQuizHangmanQuestionParser() {
    return singleton;
  }

  GeoQuizHangmanQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    throw UnimplementedError();
  }
}
