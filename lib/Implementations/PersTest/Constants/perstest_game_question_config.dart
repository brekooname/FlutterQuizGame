import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';

class PersTestGameQuestionConfig extends GameQuestionConfig {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;

  late QuestionDifficulty diff0;

  static final PersTestGameQuestionConfig singleton =
      PersTestGameQuestionConfig.internal();

  factory PersTestGameQuestionConfig() {
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat1 = QuestionCategory(
          index: 1,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          questionCategoryService: DependentAnswersCategoryQuestionService())
    ];
    //
    //
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    return singleton;
  }

  PersTestGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryWithPrefixCode, String> res = HashMap();
    return res;
  }
}
