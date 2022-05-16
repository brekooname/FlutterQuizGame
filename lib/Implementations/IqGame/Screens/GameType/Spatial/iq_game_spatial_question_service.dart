import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

class IqGameSpatialQuestionService extends QuestionService {
  static final IqGameSpatialQuestionService singleton =
      IqGameSpatialQuestionService.internal();

  factory IqGameSpatialQuestionService() {
    return singleton;
  }

  IqGameSpatialQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    throw UnimplementedError();
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return [
      [
        3,
        5,
        1,
        6,
        0,
        7,
        1,
        4,
        7,
        0,
        //
        2,
        5,
        1,
        3,
        7,
        4,
        5,
        2,
        4,
        3,
        //
        6,
        0,
        1,
        7,
        1,
        0,
        7,
        6,
        4,
        0,
        //
        3,
        4,
        6,
        6,
        2,
        5,
        7,
        5,
        1
      ].elementAt(question.rawString.parseToInt).toString()
    ];
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    throw UnimplementedError();
  }
}
