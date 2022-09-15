import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

class HangmanGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;

  late QuestionDifficulty diff0;

  static final HangmanGameQuestionConfig singleton =
      HangmanGameQuestionConfig.internal();

  factory HangmanGameQuestionConfig() {
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    //
    //
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryService: DependentAnswersCategoryQuestionService())
    ];
    return singleton;
  }

  HangmanGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();
    return res;
  }
}
