
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class GeoQuizHangmanQuestionParser extends QuestionParser {

  static final GeoQuizHangmanQuestionParser singleton =
      GeoQuizHangmanQuestionParser.internal();

  factory GeoQuizHangmanQuestionParser() {
    return singleton;
  }

  GeoQuizHangmanQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }
}
