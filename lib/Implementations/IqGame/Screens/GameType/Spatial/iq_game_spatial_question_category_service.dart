import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'iq_game_spatial_question_parser.dart';
import 'iq_game_spatial_question_service.dart';

class IqGameSpatialCategoryQuestionService extends QuestionCategoryService {
  static final IqGameSpatialCategoryQuestionService singleton =
      IqGameSpatialCategoryQuestionService.internal();

  factory IqGameSpatialCategoryQuestionService() {
    return singleton;
  }

  IqGameSpatialCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  IqGameSpatialQuestionService getQuestionService() {
    return IqGameSpatialQuestionService();
  }

  @override
  IqGameSpatialQuestionParser getQuestionParser() {
    return IqGameSpatialQuestionParser();
  }
}
