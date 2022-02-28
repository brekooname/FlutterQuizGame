import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unqiue_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

class HistoryGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;

  late QuestionDifficulty diff0;
  late QuestionDifficulty diff1;
  late QuestionDifficulty diff2;
  late QuestionDifficulty diff3;

  static final HistoryGameQuestionConfig singleton =
      HistoryGameQuestionConfig.internal();

  factory HistoryGameQuestionConfig() {
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0, questionCategoryService: HistoryCategoryQuestionService()),
      singleton.cat1 = QuestionCategory(
          index: 1, questionCategoryService: HistoryCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat3 = QuestionCategory(
          index: 3,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat4 = QuestionCategory(
          index: 4,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
    ];
    //
    //
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
      singleton.diff1 = QuestionDifficulty(index: 1),
      singleton.diff2 = QuestionDifficulty(index: 2),
      singleton.diff3 = QuestionDifficulty(index: 3),
    ];
    return singleton;
  }

  HistoryGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryWithPrefixCode, String> res = HashMap();
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat0, prefixCode: 0),
        () => label.l_when_did_this_event_occur);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat1, prefixCode: 0),
        () => label.l_between_what_years_did_this_empire_exist);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 0),
        () => label.l_in_which_modern_country_did_this_event_occur);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 1),
        () => label.l_in_which_modern_country_is_this_location);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 0),
        () => label.l_identify_the_historical_figure);
    return res;
  }
}
