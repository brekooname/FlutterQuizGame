import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

class IqGameMemTestQuestionService extends QuestionService {
  static final IqGameMemTestQuestionService singleton =
      IqGameMemTestQuestionService.internal();

  factory IqGameMemTestQuestionService() {
    return singleton;
  }

  IqGameMemTestQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return [question.toString().split(":")[1]];
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    throw UnimplementedError();
  }
}
