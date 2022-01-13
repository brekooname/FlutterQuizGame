import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';

import 'geoquiz_options_question_parser.dart';
import 'geoquiz_options_question_service.dart';


class GeoQuizOptionsCategoryQuestionService
    extends QuestionCategoryService {
  static final GeoQuizOptionsCategoryQuestionService singleton =
      GeoQuizOptionsCategoryQuestionService.internal();

  factory GeoQuizOptionsCategoryQuestionService() {
    return singleton;
  }

  GeoQuizOptionsCategoryQuestionService.internal();

  @override
  String getHintButtonType() {
    return HintButtonType.hintDisableTwoAnswers;
  }

  @override
  GeoQuizOptionsQuestionService getQuestionService() {
    return GeoQuizOptionsQuestionService(questionParser: getQuestionParser());
  }

  @override
  GeoQuizOptionsQuestionParser getQuestionParser() {
    return GeoQuizOptionsQuestionParser();
  }
}
