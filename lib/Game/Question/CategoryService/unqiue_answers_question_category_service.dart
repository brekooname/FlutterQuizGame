import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/CategoryService/question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/unique_answers_question_service.dart';

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
  QuestionService getQuestionService() {
    return UniqueAnswersQuestionService(questionParser: getQuestionParser());
  }

  @override
  QuestionParser getQuestionParser() {
    return QuestionParser();
  }
}
