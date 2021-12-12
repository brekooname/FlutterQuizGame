
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';

class HistoryQuestionParser extends QuestionParser {

  static final HistoryQuestionParser singleton = HistoryQuestionParser.internal();

  factory HistoryQuestionParser() {
    return singleton;
  }

  HistoryQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    return questionRawString.split(":")[0];
  }
}
