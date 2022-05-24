import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'iq_game_memtest_question_parser.dart';
import 'iq_game_memtest_question_service.dart';

class IqGameMemTestCategoryQuestionService extends QuestionCategoryService {
  static final IqGameMemTestCategoryQuestionService singleton =
      IqGameMemTestCategoryQuestionService.internal();

  factory IqGameMemTestCategoryQuestionService() {
    return singleton;
  }

  IqGameMemTestCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  IqGameMemTestQuestionService getQuestionService() {
    return IqGameMemTestQuestionService();
  }

  @override
  IqGameMemTestQuestionParser getQuestionParser() {
    return IqGameMemTestQuestionParser();
  }
}
