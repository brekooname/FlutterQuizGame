import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'dependent_answers_question_parser.dart';

class DependentAnswersCategoryQuestionService
    extends QuestionCategoryService {
  static final DependentAnswersCategoryQuestionService singleton =
      DependentAnswersCategoryQuestionService.internal();

  factory DependentAnswersCategoryQuestionService() {
    return singleton;
  }

  DependentAnswersCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  DependentAnswersQuestionService getQuestionService() {
    return DependentAnswersQuestionService(questionParser: getQuestionParser());
  }

  @override
  DependentAnswersQuestionParser getQuestionParser() {
    return DependentAnswersQuestionParser();
  }
}
