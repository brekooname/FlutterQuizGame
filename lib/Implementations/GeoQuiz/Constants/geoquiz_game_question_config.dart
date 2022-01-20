import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AnswerOptions/geoquiz_options_question_category_service.dart';

class GeoQuizGameQuestionConfig extends GameQuestionConfig {

  //POPULATION ===> top 10
  //diff0
  late QuestionCategory cat0;

  //AREA ===> top 10
  //diff1
  late QuestionCategory cat1;

  //NEIGHBOURS ===>
  //// diff 0 ----> find one
  //// diff 1 ----> find by neighbours
  //// diff 2 ----> find all
  //// diff 3 ----> find all
  late QuestionCategory cat2;

  //GEOGRAPHICAL REGION ===>
  //// diff 0 ----> find one
  //// diff 1 ----> find by geo region
  //// diff 2 ----> find at least 5
  late QuestionCategory cat3;

  //EMPIRE ===>
  //// diff 1 ----> find one
  //// diff 2 ----> find by empire
  //// diff 3 ----> find at least 5
  late QuestionCategory cat4;

  //LANDMARKS
  late QuestionCategory cat5;

  //CAPITALS
  late QuestionCategory cat6;

  //FLAGS
  late QuestionCategory cat7;

  //NATURAL WONDERS
  late QuestionCategory cat8;

  //MAPS
  late QuestionCategory cat9;

  QuestionDifficulty diff0 = QuestionDifficulty(index: 0);
  QuestionDifficulty diff1 = QuestionDifficulty(index: 1);
  QuestionDifficulty diff2 = QuestionDifficulty(index: 2);
  QuestionDifficulty diff3 = QuestionDifficulty(index: 3);

  static final GeoQuizGameQuestionConfig singleton =
      GeoQuizGameQuestionConfig.internal();

  factory GeoQuizGameQuestionConfig() {
    //
    //CATEGORIES
    singleton.cat0 = QuestionCategory(
        index: 0,
        categoryLabel: "POPULATION",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat1 = QuestionCategory(
        index: 1,
        categoryLabel: "AREA",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat2 = QuestionCategory(
        index: 2,
        categoryLabel: "NEIGHBOURS",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat3 = QuestionCategory(
        index: 3,
        categoryLabel: "GEOGRAPHICAL REGION",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat4 = QuestionCategory(
        index: 4,
        categoryLabel: "EMPIRE",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat5 = QuestionCategory(
        index: 5,
        categoryLabel: "LANDMARKS",
        questionCategoryService: DependentAnswersCategoryQuestionService());
    singleton.cat6 = QuestionCategory(
        index: 6,
        categoryLabel: "CAPITALS",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat7 = QuestionCategory(
        index: 7,
        categoryLabel: "FLAGS",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat8 = QuestionCategory(
        index: 8,
        categoryLabel: "NATURAL WONDERS",
        questionCategoryService: DependentAnswersCategoryQuestionService());
    singleton.cat9 = QuestionCategory(
        index: 9,
        categoryLabel: "MAPS",
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());

    return singleton;
  }

  GeoQuizGameQuestionConfig.internal();

  @override
  List<QuestionDifficulty> get difficulties => [diff0, diff1, diff2, diff3];

  @override
  List<QuestionCategory> get categories =>
      [cat0, cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9];

  @override
  Map<QuestionCategoryWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryWithPrefixCode, String> res = HashMap();
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat0, prefixCode: 0),
        () => label.l_which_country_is_more_populous);
    res.putIfAbsent(
      QuestionCategoryWithPrefixCode(category: cat1, prefixCode: 0),
      () => label.l_which_country_is_larger_in_size,
    );
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 0),
        () => label.l_find_a_neighbour_of_this_country);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 1),
        () => label.l_find_all_the_neighbours_of_this_country);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 2),
        () => label.l_which_country_has_these_neighbours);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat3, prefixCode: 0),
        () => label.l_which_country_is_located_here);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat3, prefixCode: 1),
        () => label.l_which_countries_are_located_here);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat3, prefixCode: 2),
        () => label.l_where_are_these_countries_located);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 0),
        () => label.l_which_country_was_partly_or_entirely_part_of_this_empire);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 1),
        () => label
            .l_which_countries_were_partly_or_entirely_part_of_this_empire);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 2),
        () => label.l_which_empire_included_territories_from_these_countries);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat5, prefixCode: 0),
        () => label.l_landmarks);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat6, prefixCode: 0),
        () => label.l_capital_city);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat7, prefixCode: 0),
        () => label.l_flags);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat8, prefixCode: 0),
        () => label.l_natural_wonders);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat9, prefixCode: 0),
        () => label.l_find_on_map);
    return res;
  }
}
