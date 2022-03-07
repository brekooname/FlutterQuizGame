import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';

class AnatomyGameQuestionConfig extends GameQuestionConfig {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;
  late QuestionCategory cat5;
  late QuestionCategory cat6;
  late QuestionCategory cat7;
  late QuestionCategory cat8;
  late QuestionCategory cat9;
  late QuestionCategory cat10;
  late QuestionCategory cat11;

  late QuestionDifficulty diff0;
  late QuestionDifficulty diff1;

  static final AnatomyGameQuestionConfig singleton =
      AnatomyGameQuestionConfig.internal();

  factory AnatomyGameQuestionConfig() {
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Organs"),
      singleton.cat1 = QuestionCategory(
          index: 1,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Bones"),
      singleton.cat2 = QuestionCategory(
          index: 2,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Muscles"),
      singleton.cat3 = QuestionCategory(
          index: 3,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Circulatory system"),
      singleton.cat4 = QuestionCategory(
          index: 4,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Nervous system"),
      singleton.cat5 = QuestionCategory(
          index: 5,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Mouth"),
      singleton.cat6 = QuestionCategory(
          index: 6,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Brain"),
      singleton.cat7 = QuestionCategory(
          index: 7,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Ear"),
      singleton.cat8 = QuestionCategory(
          index: 8,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Heart"),
      singleton.cat9 = QuestionCategory(
          index: 9,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Eye"),
      singleton.cat10 = QuestionCategory(
          index: 10,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Cell"),
      singleton.cat11 = QuestionCategory(
          index: 11,
          questionCategoryService: DependentAnswersCategoryQuestionService(),
          categoryLabel: "Chemical elements of the human body"),
    ];
    //
    //
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
      singleton.diff1 = QuestionDifficulty(index: 1),
    ];
    return singleton;
  }

  AnatomyGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryWithPrefixCode, String> res = HashMap();
    return res;
  }
}
