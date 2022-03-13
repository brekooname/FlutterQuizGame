import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_category_service.dart';

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
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
      singleton.diff1 = QuestionDifficulty(index: 1),
    ];
    //
    //
    var questionCategoryServiceMap = {
      singleton.diff0: ImageClickCategoryQuestionService(),
      singleton.diff1: DependentAnswersCategoryQuestionService(),
    };
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Organs"),
      singleton.cat1 = QuestionCategory(
          index: 1,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Bones"),
      singleton.cat2 = QuestionCategory(
          index: 2,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Muscles"),
      singleton.cat3 = QuestionCategory(
          index: 3,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Circulatory system"),
      singleton.cat4 = QuestionCategory(
          index: 4,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Nervous system"),
      singleton.cat5 = QuestionCategory(
          index: 5,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Mouth"),
      singleton.cat6 = QuestionCategory(
          index: 6,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Brain"),
      singleton.cat7 = QuestionCategory(
          index: 7,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Ear"),
      singleton.cat8 = QuestionCategory(
          index: 8,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Heart"),
      singleton.cat9 = QuestionCategory(
          index: 9,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Eye"),
      singleton.cat10 = QuestionCategory(
          index: 10,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Cell"),
      singleton.cat11 = QuestionCategory(
          index: 11,
          questionCategoryServiceMap: questionCategoryServiceMap,
          categoryLabel: "Chemical elements of the human body"),
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
