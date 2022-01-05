import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unqiue_answers_question_category_service.dart';

class GeoQuizGameQuestionConfig extends GameQuestionConfig {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;

  late QuestionDifficulty diff0;
  late QuestionDifficulty diff1;
  late QuestionDifficulty diff2;
  late QuestionDifficulty diff3;

  static final GeoQuizGameQuestionConfig singleton =
      GeoQuizGameQuestionConfig.internal();

  factory GeoQuizGameQuestionConfig() {
    //
    //CATEGORIES
    singleton.cat0 = QuestionCategory(
        index: 0, questionCategoryService: HangmanCategoryQuestionService());
    singleton.cat1 = QuestionCategory(
        index: 1, questionCategoryService: DependentAnswersCategoryQuestionService());
    singleton.cat2 = QuestionCategory(
        index: 2,
        questionCategoryService: DependentAnswersCategoryQuestionService());
    singleton.cat3 = QuestionCategory(
        index: 3,
        questionCategoryService: UniqueAnswersCategoryQuestionService());
    singleton.cat4 = QuestionCategory(
        index: 4,
        questionCategoryService: DependentAnswersCategoryQuestionService());
    //
    //DIFFICULTIES
    singleton.diff0 = QuestionDifficulty(
        index: 0, categories: [singleton.cat0, singleton.cat1]);
    singleton.diff1 = QuestionDifficulty(
        index: 1, categories: [singleton.cat0, singleton.cat1]);
    singleton.diff2 = QuestionDifficulty(
        index: 2, categories: [singleton.cat0, singleton.cat1]);
    singleton.diff3 = QuestionDifficulty(
        index: 3, categories: [singleton.cat0, singleton.cat1]);
    return singleton;
  }

  GeoQuizGameQuestionConfig.internal();

  @override
  List<QuestionDifficulty> get difficulties => [diff0, diff1, diff2, diff3];

  @override
  List<QuestionCategory> get categories => [cat0, cat1, cat2, cat3, cat4];

  @override
  Map<QuestionCategoryWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryWithPrefixCode, String> res = HashMap();
    return res;
  }
}
