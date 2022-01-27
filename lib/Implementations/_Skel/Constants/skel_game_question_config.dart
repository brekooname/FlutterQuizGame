import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';

class SkelGameQuestionConfig extends GameQuestionConfig {
  late QuestionCategory cat0;

  QuestionDifficulty diff0 = QuestionDifficulty(index: 0);

  static final SkelGameQuestionConfig singleton =
      SkelGameQuestionConfig.internal();

  factory SkelGameQuestionConfig() {
    //
    //CATEGORIES
    singleton.cat0 = QuestionCategory(
        index: 0,
        questionCategoryService: DependentAnswersCategoryQuestionService());
    return singleton;
  }

  SkelGameQuestionConfig.internal();

  @override
  List<QuestionDifficulty> get difficulties => [
        diff0,
      ];

  @override
  List<QuestionCategory> get categories => [
        cat0,
      ];

  @override
  Map<QuestionCategoryWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryWithPrefixCode, String> res = HashMap();
    return res;
  }
}
