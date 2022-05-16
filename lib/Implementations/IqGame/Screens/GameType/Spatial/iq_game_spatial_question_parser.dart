
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class IqGameSpatialQuestionParser extends QuestionParser {

  static final IqGameSpatialQuestionParser singleton = IqGameSpatialQuestionParser.internal();

  factory IqGameSpatialQuestionParser() {
    return singleton;
  }

  IqGameSpatialQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }
}
