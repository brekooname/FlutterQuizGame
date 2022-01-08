import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/CountriesQuiz/geoquiz_countries_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/CountriesQuiz/geoquiz_countries_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/Hangman/geoquiz_hangman_question_parser.dart';

class GeoQuizCountriesCategoryQuestionService
    extends QuestionCategoryService {
  static final GeoQuizCountriesCategoryQuestionService singleton =
      GeoQuizCountriesCategoryQuestionService.internal();

  factory GeoQuizCountriesCategoryQuestionService() {
    return singleton;
  }

  GeoQuizCountriesCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hint_disable_two_answers;
  }

  @override
  GeoQuizCountriesQuestionService getQuestionService() {
    return GeoQuizCountriesQuestionService(questionParser: getQuestionParser());
  }

  @override
  GeoQuizCountriesQuestionParser getQuestionParser() {
    return GeoQuizCountriesQuestionParser();
  }
}
