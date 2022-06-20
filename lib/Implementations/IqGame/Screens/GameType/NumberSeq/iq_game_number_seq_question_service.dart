import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';

class IqGameNumberSeqQuestionService extends QuestionService {
  static final IqGameNumberSeqQuestionService singleton =
      IqGameNumberSeqQuestionService.internal();

  factory IqGameNumberSeqQuestionService() {
    return singleton;
  }

  IqGameNumberSeqQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return [
      [
        243,
        2,
        3,
        10,
        3,
        32,
        10,
        4,
        636,
        36,
        ////
        6,
        2,
        14,
        19,
        469,
        38,
        3,
        81,
      ].elementAt(question.index).toString()
    ];
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    throw UnimplementedError();
  }
}
