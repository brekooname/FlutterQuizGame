
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class IqGameMemTestQuestionParser extends QuestionParser {

  static final IqGameMemTestQuestionParser singleton = IqGameMemTestQuestionParser.internal();

  factory IqGameMemTestQuestionParser() {
    return singleton;
  }

  IqGameMemTestQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }
}
