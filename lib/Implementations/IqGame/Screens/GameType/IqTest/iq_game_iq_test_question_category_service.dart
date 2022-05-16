import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/IqTest/iq_game_iq_test_question_service.dart';

import 'iq_game_iq_test_question_parser.dart';

class IqGameIqTestCategoryQuestionService extends QuestionCategoryService {
  static final IqGameIqTestCategoryQuestionService singleton =
      IqGameIqTestCategoryQuestionService.internal();

  factory IqGameIqTestCategoryQuestionService() {
    return singleton;
  }

  IqGameIqTestCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  IqGameIqTestQuestionService getQuestionService() {
    return IqGameIqTestQuestionService();
  }

  @override
  IqGameIqTestQuestionParser getQuestionParser() {
    return IqGameIqTestQuestionParser();
  }
}
