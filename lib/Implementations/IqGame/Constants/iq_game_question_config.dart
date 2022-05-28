import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/IqTest/iq_game_iq_test_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/Math/iq_game_math_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/MemTest/iq_game_memtest_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/NumberSeq/iq_game_number_seq_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

class IqGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;
  late QuestionCategory cat5;

  late QuestionDifficulty diff0;

  static final IqGameQuestionConfig singleton = IqGameQuestionConfig.internal();

  factory IqGameQuestionConfig() {
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    //
    //
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          categoryLabel: "IQ",
          questionCategoryService: IqGameIqTestCategoryQuestionService()),
      singleton.cat1 = QuestionCategory(
          index: 1,
          categoryLabel: "Spatial Reasoning",
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          categoryLabel: "Number Sequences",
          questionCategoryService: IqGameNumberSeqCategoryQuestionService()),
      singleton.cat3 = QuestionCategory(
          index: 3,
          categoryLabel: "Short Term Memory",
          questionCategoryService: IqGameMemTestCategoryQuestionService()),
      singleton.cat4 = QuestionCategory(
          index: 4,
          categoryLabel: "Math",
          questionCategoryService: IqGameMathCategoryQuestionService()),
      singleton.cat5 = QuestionCategory(
          index: 5,
          categoryLabel: "Math",
          questionCategoryService: IqGameMathCategoryQuestionService()),
    ];
    return singleton;
  }

  IqGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();
    return res;
  }
}
