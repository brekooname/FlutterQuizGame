
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class IqGameMathQuestionParser extends QuestionParser {

  static final IqGameMathQuestionParser singleton = IqGameMathQuestionParser.internal();

  factory IqGameMathQuestionParser() {
    return singleton;
  }

  IqGameMathQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }
}
