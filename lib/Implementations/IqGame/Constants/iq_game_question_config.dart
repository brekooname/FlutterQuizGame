import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unqiue_answers_question_category_service.dart';
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
    var staticLabel = LabelMixin.staticLabel;
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          categoryLabel: staticLabel.l_iq,
          questionCategoryService: IqGameIqTestCategoryQuestionService()),
      singleton.cat1 = QuestionCategory(
          index: 1,
          categoryLabel: staticLabel.l_spatial_reasoning,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          categoryLabel: staticLabel.l_number_sequences,
          questionCategoryService: IqGameNumberSeqCategoryQuestionService()),
      singleton.cat3 = QuestionCategory(
          index: 3,
          categoryLabel: staticLabel.l_short_term_memory,
          questionCategoryService: IqGameMemTestCategoryQuestionService()),
      singleton.cat4 = QuestionCategory(
          index: 4,
          categoryLabel: staticLabel.l_math,
          questionCategoryService: IqGameMathCategoryQuestionService()),
      singleton.cat5 = QuestionCategory(
          index: 5,
          categoryLabel: staticLabel.l_general_knowledge,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
    ];
    return singleton;
  }

  IqGameQuestionConfig.internal();

  bool isIqTestCategory(QuestionCategory category) {
    return category == IqGameQuestionConfig().cat0;
  }

  bool isNumberSeqCategory(QuestionCategory category) {
    return category == IqGameQuestionConfig().cat2;
  }

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();
    return res;
  }
}
