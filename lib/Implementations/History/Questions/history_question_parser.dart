
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class HistoryQuestionParser extends QuestionParser {

  static final HistoryQuestionParser singleton = HistoryQuestionParser.internal();

  factory HistoryQuestionParser() {
    return singleton;
  }

  HistoryQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0];
  }
}
