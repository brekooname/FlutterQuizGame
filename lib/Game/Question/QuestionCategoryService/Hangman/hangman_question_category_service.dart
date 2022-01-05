import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_category_service.dart';

import 'hangman_question_parser.dart';
import 'hangman_question_service.dart';

class HangmanCategoryQuestionService
    extends QuestionCategoryService {
  static final HangmanCategoryQuestionService singleton =
      HangmanCategoryQuestionService.internal();

  factory HangmanCategoryQuestionService() {
    return singleton;
  }

  HangmanCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hint_press_random_answer;
  }

  @override
  HangmanQuestionService getQuestionService() {
    return HangmanQuestionService(questionParser: getQuestionParser());
  }

  @override
  HangmanQuestionParser getQuestionParser() {
    return HangmanQuestionParser();
  }
}
