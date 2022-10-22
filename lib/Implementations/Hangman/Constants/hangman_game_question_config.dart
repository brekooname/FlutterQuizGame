import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

import '../../../Game/Question/QuestionCategoryService/Hangman/hangman_question_category_service.dart';

class HangmanGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;
  late QuestionCategory cat5;

  late QuestionDifficulty diff0;
  late QuestionDifficulty diff1;
  late QuestionDifficulty diff2;
  late QuestionDifficulty diff3;
  late QuestionDifficulty diff4;
  late QuestionDifficulty diff5;

  static final HangmanGameQuestionConfig singleton =
      HangmanGameQuestionConfig.internal();

  HangmanGameQuestionConfig.internal();

  factory HangmanGameQuestionConfig() {
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
      singleton.diff1 = QuestionDifficulty(index: 1),
      singleton.diff2 = QuestionDifficulty(index: 2),
      singleton.diff3 = QuestionDifficulty(index: 3),
      singleton.diff4 = QuestionDifficulty(index: 4),
      singleton.diff5 = QuestionDifficulty(index: 5),
    ];
    //
    //
    singleton.categories = [
      singleton.cat1 = QuestionCategory(
          index: 1,
          categoryLabel: "Animals",
          questionCategoryService: HangmanCategoryQuestionService()),
      singleton.cat4 = QuestionCategory(
          index: 4,
          categoryLabel: "Food",
          questionCategoryService: HangmanCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          categoryLabel: "Plants",
          questionCategoryService: HangmanCategoryQuestionService()),
      singleton.cat3 = QuestionCategory(
          index: 3,
          categoryLabel: "Kitchen",
          questionCategoryService: HangmanCategoryQuestionService()),
      singleton.cat0 = QuestionCategory(
          index: 0,
          categoryLabel: "Countries",
          questionCategoryService: HangmanCategoryQuestionService()),
      singleton.cat5 = QuestionCategory(
          index: 5,
          categoryLabel: "Mixed",
          questionCategoryService: HangmanCategoryQuestionService()),
    ];
    return singleton;
  }

  bool isMixedCategory(QuestionCategory cat) {
    return cat.index == 5;
  }

  List<QuestionCategory> getAllCategoriesWithoutMixCategory() {
    var categoriesWithoutMixed = categories;
    categoriesWithoutMixed.removeWhere((category) => isMixedCategory(category));
    return categoriesWithoutMixed;
  }

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();
    return res;
  }
}
