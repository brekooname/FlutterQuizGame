import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_game_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unique_answers_question_service.dart';

import 'dependent_answers_question_parser.dart';

class DependentAnswersCategoryQuestionService extends QuestionCategoryService {
  static final DependentAnswersCategoryQuestionService singleton =
  DependentAnswersCategoryQuestionService.internal();

  factory DependentAnswersCategoryQuestionService() {
    return singleton;
  }

  DependentAnswersCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hint_disable_two_answers;
  }

  @override
  QuestionService getQuestionService() {
    return DependentAnswersQuestionService(questionParser: getQuestionParser());
  }

  @override
  DependentAnswersQuestionParser getQuestionParser() {
    return DependentAnswersQuestionParser();
  }
}
