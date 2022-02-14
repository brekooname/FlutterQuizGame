import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/all_questions_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';

class DopeWarsAllQuestions extends AllQuestionsService {
  static final DopeWarsAllQuestions singleton = DopeWarsAllQuestions.internal();

  factory DopeWarsAllQuestions() {
    return singleton;
  }

  DopeWarsAllQuestions.internal();

  @override
  Map<Language, Map<CategoryDifficulty, List<Question>>>
      getAllQuestionsWithLanguages() {
    Map<Language, Map<CategoryDifficulty, List<Question>>> result =
        HashMap<Language, Map<CategoryDifficulty, List<Question>>>();
    var questionConfig = DopeWarsGameQuestionConfig();
    addQuestions(
        result, //
        Language.en, //
        questionConfig.cat0, //
        questionConfig.diff0, //
        ["default game"]);
    return result;
  }
}
