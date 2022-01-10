import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';

import 'history_question_parser.dart';

class HistoryQuestionService extends QuestionService {
  late HistoryQuestionParser questionParser;

  static final HistoryQuestionService singleton =
  HistoryQuestionService.internal();

  factory HistoryQuestionService(
      {required HistoryQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  HistoryQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question);
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    throw UnimplementedError();
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    throw UnimplementedError();
  }
}
