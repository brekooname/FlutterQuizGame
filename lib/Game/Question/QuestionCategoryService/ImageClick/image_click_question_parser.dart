import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';

import '../Base/question_parser.dart';

class ImageClickQuestionParser extends QuestionParser {
  static final ImageClickQuestionParser singleton =
      ImageClickQuestionParser.internal();

  factory ImageClickQuestionParser() {
    return singleton;
  }

  ImageClickQuestionParser.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0].trim();
  }

  //We return a list in case of multiple correct answers
  // but for this case there is only one correct answer
  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    Question? questionOpt = getQuestionForRef(question.index);
    if (questionOpt == null) {
      return [];
    }
    return [questionOpt.rawString.split(":")[0]];
  }
}
