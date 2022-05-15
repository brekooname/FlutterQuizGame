
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class IqGameIqTestQuestionParser extends QuestionParser {

  static final IqGameIqTestQuestionParser singleton = IqGameIqTestQuestionParser.internal();

  factory IqGameIqTestQuestionParser() {
    return singleton;
  }

  IqGameIqTestQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }
}
