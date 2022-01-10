import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'geoquiz_countries_multiple_options_question_parser.dart';
import 'geoquiz_countries_multiple_options_question_service.dart';


class GeoQuizCountriesMultipleOptionsCategoryQuestionService
    extends QuestionCategoryService {
  static final GeoQuizCountriesMultipleOptionsCategoryQuestionService singleton =
      GeoQuizCountriesMultipleOptionsCategoryQuestionService.internal();

  factory GeoQuizCountriesMultipleOptionsCategoryQuestionService() {
    return singleton;
  }

  GeoQuizCountriesMultipleOptionsCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  GeoQuizCountriesMultipleOptionsQuestionService getQuestionService() {
    return GeoQuizCountriesMultipleOptionsQuestionService(questionParser: getQuestionParser());
  }

  @override
  GeoQuizCountriesMultipleOptionsQuestionParser getQuestionParser() {
    return GeoQuizCountriesMultipleOptionsQuestionParser();
  }
}
