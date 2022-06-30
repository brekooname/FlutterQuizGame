import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class AstronomyAllQuestions extends AllQuestionsService {
  static final AstronomyAllQuestions singleton = AstronomyAllQuestions.internal();

  factory AstronomyAllQuestions() {
    return singleton;
  }

  AstronomyAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    var questionConfig = AstronomyGameQuestionConfig();
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    addEN(result, questionConfig);
    return result;
  }

  void addEN(Map<Language, Map<CategoryDifficulty, List<Question>>> result,
      AstronomyGameQuestionConfig questionConfig) {
    var language = Language.en;
    addQuestions(
        result, //
        language, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["The Sun:1,2,3,4,5,6,7,8,9:7,96.2", "Mercury:0,2,3,4,5,6,7,8,9:16,83.4", "Venus:1,0,3,4,5,6,7,8,9:35.9,81.4", "Earth:1,2,0,4,5,6,7,8,9:33.1,64.6", "Mars:1,2,3,0,5,6,7,8,9:55.3,62.64", "Jupiter:1,2,3,4,0,6,7,8,9:42.8,41.15", "Saturn:1,2,3,4,5,0,7,8,9:80.8,49.4", "Uranus:1,2,3,4,5,6,0,8,9:47.7,16.15", "Neptune:1,2,3,4,5,6,7,0,9:85.4,18.74", "Pluto:1,2,3,4,5,6,7,8,0:83.33,5.33"]);
  }
}
