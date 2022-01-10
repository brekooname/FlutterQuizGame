import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unique_answers_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unique_answers_question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';

class UniqueAnswersCategoryQuestionService extends QuestionCategoryService {
  static final UniqueAnswersCategoryQuestionService singleton =
      UniqueAnswersCategoryQuestionService.internal();

  factory UniqueAnswersCategoryQuestionService() {
    return singleton;
  }

  UniqueAnswersCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hint_disable_two_answers;
  }

  @override
  UniqueAnswersQuestionService getQuestionService() {
    return UniqueAnswersQuestionService(questionParser: getQuestionParser());
  }

  @override
  UniqueAnswersQuestionParser getQuestionParser() {
    return UniqueAnswersQuestionParser();
  }
}
