import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unique_answers_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unique_answers_question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';

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
    return HintButtonType.hint_disable_two_answers;
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
