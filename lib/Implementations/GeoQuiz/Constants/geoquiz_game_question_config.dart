import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AnswerOptions/geoquiz_options_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/Hangman/geoquiz_hangman_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';

class GeoQuizGameQuestionConfig extends GameQuestionConfig {
  final LocalizationService _localizationService = LocalizationService();

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
  //// diff 3 ----> find all hangman
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
      questionCategoryService: GeoQuizOptionsCategoryQuestionService(),
    );
    singleton.cat1 = QuestionCategory(
        index: 1,
        questionCategoryService: getGeoQuizStatisticsCategoryQuestionService());
    singleton.cat2 = QuestionCategory(
        index: 2,
        questionCategoryService: GeoQuizOptionsCategoryQuestionService(),
        questionCategoryServiceMap: {
          singleton.diff3: getGeoQuizStatisticsCategoryQuestionService()
        });
    singleton.cat3 = QuestionCategory(
        index: 3,
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat4 = QuestionCategory(
        index: 4,
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat5 = QuestionCategory(
        index: 5,
        questionCategoryService: DependentAnswersCategoryQuestionService());
    singleton.cat6 = QuestionCategory(
        index: 6,
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat7 = QuestionCategory(
        index: 7,
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());
    singleton.cat8 = QuestionCategory(
        index: 8,
        questionCategoryService: DependentAnswersCategoryQuestionService());
    singleton.cat9 = QuestionCategory(
        index: 9,
        questionCategoryService: GeoQuizOptionsCategoryQuestionService());

    return singleton;
  }

  static QuestionCategoryService getGeoQuizStatisticsCategoryQuestionService() {
    return HangmanService.isHangmanSupported()
        ? GeoQuizHangmanCategoryQuestionService()
        : GeoQuizOptionsCategoryQuestionService();
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
        () => _localizationService.formatTextWithParams(
                label
                    .l_which_country_is_among_the_top_param0_most_populous_countries_in_the_world,
                [
                  GeoQuizQuestionCollectorService
                      .numberOfQuestionsForStatisticsCategory
                      .toString()
                ]));
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat1, prefixCode: 0),
        () => _localizationService.formatTextWithParams(
                label
                    .l_which_country_is_among_the_top_param0_largest_countries_in_the_world_by_land_area,
                [
                  GeoQuizQuestionCollectorService
                      .numberOfQuestionsForStatisticsCategory
                      .toString()
                ]));
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 0),
        () => label.l_find_a_neighbour_of_this_country);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 1),
        () => label.l_find_all_neighbours_of_this_country);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat2, prefixCode: 2),
        () => label.l_which_country_has_these_neighbours);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat3, prefixCode: 0),
        () => label.l_which_country_is_in_this_geographical_region);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat3, prefixCode: 1),
        () => label.l_which_countries_are_in_this_geographical_region);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat3, prefixCode: 2),
        () => label.l_to_which_geographical_region_do_these_countries_belong);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 0),
        () => label
            .l_which_country_or_part_of_this_country_was_part_of_this_empire);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 1),
        () => label
            .l_which_countries_or_part_of_these_countries_were_part_of_this_empire);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat4, prefixCode: 2),
        () => label
            .l_to_which_empire_did_these_countries_or_part_of_these_countries_belong);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat5, prefixCode: 0),
        () => label.l_where_is_this_landmark_located);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat6, prefixCode: 0),
        () => label.l_which_country_has_this_capital);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat7, prefixCode: 0),
        () => label.l_which_country_has_this_flag);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat8, prefixCode: 0),
        () => label.l_where_is_this_natural_wonder_located);
    res.putIfAbsent(
        QuestionCategoryWithPrefixCode(category: cat9, prefixCode: 0),
        () => label.l_which_country_is_shown_on_the_map);
    return res;
  }
}
