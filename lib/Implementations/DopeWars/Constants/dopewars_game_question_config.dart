import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';

class DopeWarsGameQuestionConfig extends GameQuestionConfig {
  late QuestionCategory cat0;

  late QuestionDifficulty diff0;

  static final DopeWarsGameQuestionConfig singleton =
      DopeWarsGameQuestionConfig.internal();

  factory DopeWarsGameQuestionConfig() {
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryService: DependentAnswersCategoryQuestionService())
    ];
    //
    //
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    return singleton;
  }

  DopeWarsGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();
    return res;
  }
}
