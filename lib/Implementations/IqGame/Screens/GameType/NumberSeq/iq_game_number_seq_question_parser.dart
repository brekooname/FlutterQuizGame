
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class IqGameNumberSeqQuestionParser extends QuestionParser {

  static final IqGameNumberSeqQuestionParser singleton = IqGameNumberSeqQuestionParser.internal();

  factory IqGameNumberSeqQuestionParser() {
    return singleton;
  }

  IqGameNumberSeqQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }
}
