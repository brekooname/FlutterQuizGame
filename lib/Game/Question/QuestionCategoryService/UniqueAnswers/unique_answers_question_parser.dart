import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

import '../Base/question_parser.dart';

class UniqueAnswersQuestionParser extends QuestionParser {
  static final UniqueAnswersQuestionParser singleton =
      UniqueAnswersQuestionParser.internal();

  factory UniqueAnswersQuestionParser() {
    return singleton;
  }

  UniqueAnswersQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    return [question.rawString.split("::")[2].trim()];
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split("::")[0];
  }
}
