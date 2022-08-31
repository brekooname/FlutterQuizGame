import 'dart:collection';
import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unqiue_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_timeline_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

import '../../../Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_category_service.dart';
import '../../../Game/Question/QuestionCategoryService/ImageClick/image_click_question_category_service.dart';

class AstronomyGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  //Solar system
  late QuestionCategory cat0;

  //Planet properties
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;
  late QuestionCategory cat5;
  late QuestionCategory cat6;

  //General knowledge
  late QuestionCategory cat7;
  late QuestionCategory cat8;
  late QuestionCategory cat9;
  late QuestionCategory cat10;
  late QuestionCategory cat11;
  late QuestionCategory cat12;
  late QuestionCategory cat13;
  late QuestionCategory cat14;
  late QuestionCategory cat15;
  late QuestionCategory cat16;

  late QuestionDifficulty diff0;

  late Map<QuestionCategory, Size> categoryDiagramImgDimen;
  late List<AstronomyPlanetProperties> planets;

  static final AstronomyGameQuestionConfig singleton =
      AstronomyGameQuestionConfig.internal();

  AstronomyGameQuestionConfig.internal();

  factory AstronomyGameQuestionConfig() {

    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    //
    //
    var staticLabel = LabelMixin.staticLabel;
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          categoryLabel: staticLabel.l_the_solar_system,
          questionCategoryService: ImageClickCategoryQuestionService()),
      ////////////////
      ////////////////
      ////////////////
      singleton.cat1 = QuestionCategory(
          index: 1,
          categoryLabel: staticLabel.l_radius,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          categoryLabel: staticLabel.l_gravity,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat3 = QuestionCategory(
          index: 3,
          categoryLabel: staticLabel.l_distance_from_the_sun,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat4 = QuestionCategory(
          index: 4,
          categoryLabel: staticLabel.l_mass,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat5 = QuestionCategory(
          index: 5,
          categoryLabel: staticLabel.l_orbital_period,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat6 = QuestionCategory(
          index: 6,
          categoryLabel: staticLabel.l_average_temperature,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      ////////////////
      ////////////////
      ////////////////
      singleton.cat7 = QuestionCategory(
          index: 7,
          categoryLabel: staticLabel.l_basic_astronomy,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat8 = QuestionCategory(
          index: 8,
          categoryLabel: staticLabel.l_the_universe,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat9 = QuestionCategory(
          index: 9,
          categoryLabel: staticLabel.l_the_planets,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat10 = QuestionCategory(
          index: 10,
          categoryLabel: staticLabel.l_important_events,
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat11 = QuestionCategory(
          index: 11,
          categoryLabel: staticLabel.l_space_exploration,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat12 = QuestionCategory(
          index: 12,
          categoryLabel: staticLabel.l_astronomical_objects,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat13 = QuestionCategory(
          index: 13,
          categoryLabel: staticLabel.l_astronomical_instruments,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat14 = QuestionCategory(
          index: 14,
          categoryLabel: staticLabel.l_the_history_of_the_universe,
          questionCategoryService: AstronomyTimelineCategoryQuestionService()),
      singleton.cat15 = QuestionCategory(
          index: 15,
          categoryLabel: staticLabel.l_famous_astronomers,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
      singleton.cat16 = QuestionCategory(
          index: 16,
          categoryLabel: staticLabel.l_the_solar_system,
          questionCategoryService: DependentAnswersCategoryQuestionService()),
    ];

    singleton.categoryDiagramImgDimen = {
      singleton.cat0: const Size(401, 609),
    };

    singleton.planets = [
      AstronomyPlanetProperties(
          id: 0,
          name: staticLabel.l_the_sun,
          orbitalPeriodInDays: 0,
          lightFromSunInSec: 0,
          meanTempInC: 5500,
          radius: 696340,
          massInRelationToEarth: 333000,
          gravityInRelationToEarth: 27),
      AstronomyPlanetProperties(
          id: 1,
          name: staticLabel.l_mercury,
          orbitalPeriodInDays: 88,
          lightFromSunInSec: 193,
          meanTempInC: 167,
          radius: 2439.7,
          massInRelationToEarth: 0.055,
          gravityInRelationToEarth: 0.38),
      AstronomyPlanetProperties(
          id: 2,
          name: staticLabel.l_venus,
          orbitalPeriodInDays: 225,
          lightFromSunInSec: 360,
          meanTempInC: 464,
          radius: 6052,
          massInRelationToEarth: 0.815,
          gravityInRelationToEarth: 0.9),
      AstronomyPlanetProperties(
          id: 3,
          name: staticLabel.l_earth,
          orbitalPeriodInDays: 365,
          lightFromSunInSec: 499,
          meanTempInC: 15,
          radius: 6371,
          massInRelationToEarth: 1,
          gravityInRelationToEarth: 1),
      AstronomyPlanetProperties(
          id: 4,
          name: staticLabel.l_mars,
          orbitalPeriodInDays: 687,
          lightFromSunInSec: 759,
          meanTempInC: -65,
          radius: 3389,
          massInRelationToEarth: 0.107,
          gravityInRelationToEarth: 0.38),
      AstronomyPlanetProperties(
          id: 5,
          name: staticLabel.l_jupiter,
          orbitalPeriodInDays: 4332,
          lightFromSunInSec: 2595,
          meanTempInC: -110,
          radius: 69911,
          massInRelationToEarth: 317.8,
          gravityInRelationToEarth: 2.4),
      AstronomyPlanetProperties(
          id: 6,
          name: staticLabel.l_saturn,
          orbitalPeriodInDays: 10747,
          lightFromSunInSec: 4759,
          meanTempInC: -140,
          radius: 58232,
          massInRelationToEarth: 95.16,
          gravityInRelationToEarth: 0.9),
      AstronomyPlanetProperties(
          id: 7,
          name: staticLabel.l_uranus,
          orbitalPeriodInDays: 30589,
          lightFromSunInSec: 9575,
          meanTempInC: -195,
          radius: 25362,
          massInRelationToEarth: 14.54,
          gravityInRelationToEarth: 0.9),
      AstronomyPlanetProperties(
          id: 8,
          name: staticLabel.l_neptune,
          orbitalPeriodInDays: 59800,
          lightFromSunInSec: 14998,
          meanTempInC: -200,
          radius: 24622,
          massInRelationToEarth: 17.15,
          gravityInRelationToEarth: 1.1),
      AstronomyPlanetProperties(
          id: 9,
          name: staticLabel.l_pluto,
          orbitalPeriodInDays: 90560,
          lightFromSunInSec: 19680,
          meanTempInC: -225,
          radius: 1188,
          massInRelationToEarth: 0.0022,
          gravityInRelationToEarth: 0.07),
      AstronomyPlanetProperties(
          id: 10,
          name: staticLabel.l_moon,
          orbitalPeriodInDays: 0,
          lightFromSunInSec: 0,
          meanTempInC: -20,
          radius: 1737,
          massInRelationToEarth: 0.012,
          gravityInRelationToEarth: 0.16),
    ];

    return singleton;
  }

  bool isTimelineCategory(QuestionCategory category) {
    return category.index == 14;
  }

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();

    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat1, prefixCode: 0),
        () => label.l_planet_radius_compared_to_earth_radius);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat2, prefixCode: 0),
        () => label.l_how_much_does_1_kg_weigh_on_this_planet);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat3, prefixCode: 0),
        () => label.l_how_much_time_does_it_take_for_sunlight_to_reach_this_planet);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat4, prefixCode: 0),
        () => label.l_how_many_times_larger_than_earth_is_this_planet);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat5, prefixCode: 0),
        () => label.l_how_many_days_does_it_take_for_this_planet_to_orbit_the_sun);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat6, prefixCode: 0),
        () => label.l_what_is_the_average_temperature_of_this_planet);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat11, prefixCode: 0),
        () => label.l_space_exploration);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat12, prefixCode: 0),
        () => label.l_astronomical_objects);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat13, prefixCode: 0),
        () => label.l_astronomical_instruments);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat14, prefixCode: 0),
        () => label.l_when_did_this_event_occur);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat15, prefixCode: 0),
        () => label.l_famous_astronomers);
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(
            category: cat16, prefixCode: 0),
        () => label.l_the_solar_system);

    return res;
  }
}

class AstronomyPlanetProperties {
  int id;
  String name;
  int orbitalPeriodInDays;
  int lightFromSunInSec;
  int meanTempInC;
  double radius;
  double massInRelationToEarth;
  double gravityInRelationToEarth;

  AstronomyPlanetProperties(
      {required this.id,
      required this.name,
      required this.orbitalPeriodInDays,
      required this.lightFromSunInSec,
      required this.meanTempInC,
      required this.radius,
      required this.massInRelationToEarth,
      required this.gravityInRelationToEarth});
}
