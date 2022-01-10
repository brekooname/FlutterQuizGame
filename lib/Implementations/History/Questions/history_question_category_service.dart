import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'history_question_parser.dart';
import 'history_question_service.dart';

class HistoryCategoryQuestionService extends QuestionCategoryService {
  static final HistoryCategoryQuestionService singleton =
  HistoryCategoryQuestionService.internal();

  factory HistoryCategoryQuestionService() {
    return singleton;
  }

  HistoryCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  HistoryQuestionService getQuestionService() {
    return HistoryQuestionService(questionParser: getQuestionParser());
  }

  @override
  HistoryQuestionParser getQuestionParser() {
    return HistoryQuestionParser();
  }
}
