import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/Hangman/geoquiz_hangman_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/Hangman/geoquiz_hangman_question_service.dart';

class GeoQuizHangmanCategoryQuestionService extends QuestionCategoryService {
  static final GeoQuizHangmanCategoryQuestionService singleton =
      GeoQuizHangmanCategoryQuestionService.internal();

  factory GeoQuizHangmanCategoryQuestionService() {
    return singleton;
  }

  GeoQuizHangmanCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hint_press_random_answer;
  }

  @override
  GeoQuizHangmanQuestionService getQuestionService() {
    return GeoQuizHangmanQuestionService(questionParser: getQuestionParser());
  }

  @override
  GeoQuizHangmanQuestionParser getQuestionParser() {
    return GeoQuizHangmanQuestionParser();
  }
}
