import 'dart:collection';
import 'dart:ui';

import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/UniqueAnswers/unqiue_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

import '../../../Game/Question/QuestionCategoryService/ImageClick/image_click_question_category_service.dart';

class AstronomyGameQuestionConfig extends GameQuestionConfig with LabelMixin {
  late QuestionCategory cat0;
  late QuestionCategory cat1;
  late QuestionCategory cat2;
  late QuestionCategory cat3;
  late QuestionCategory cat4;
  late QuestionCategory cat5;
  late QuestionCategory cat6;

  late QuestionDifficulty diff0;

  late Map<QuestionCategory, Size> categoryDiagramImgDimen;
  late List<AstronomyPlanetProperties> planets;

  static final AstronomyGameQuestionConfig singleton =
      AstronomyGameQuestionConfig.internal();

  factory AstronomyGameQuestionConfig() {
    singleton.difficulties = [
      singleton.diff0 = QuestionDifficulty(index: 0),
    ];
    //
    //
    singleton.categories = [
      singleton.cat0 = QuestionCategory(
          index: 0,
          categoryLabel: "solar system",
          questionCategoryService: ImageClickCategoryQuestionService()),
      singleton.cat1 = QuestionCategory(
          index: 1,
          categoryLabel: "radius",
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat2 = QuestionCategory(
          index: 2,
          categoryLabel: "gravity",
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat3 = QuestionCategory(
          index: 3,
          categoryLabel: "distance from Sun",
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat4 = QuestionCategory(
          index: 4,
          categoryLabel: "mass",
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat5 = QuestionCategory(
          index: 5,
          categoryLabel: "orbital Period",
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
      singleton.cat6 = QuestionCategory(
          index: 6,
          categoryLabel: "average Temperature",
          questionCategoryService: UniqueAnswersCategoryQuestionService()),
    ];

    singleton.categoryDiagramImgDimen = {
      singleton.cat0: const Size(401, 609),
    };

    singleton.planets = [
      AstronomyPlanetProperties(
          id: 0,
          name: "Sun",
          orbitalPeriodInDays: 0,
          lightFromSunInSec: 0,
          meanTempInC: 5500,
          radius: 696340,
          massInRelationToEarth: 333000,
          gravityInRelationToEarth: 27),
      AstronomyPlanetProperties(
          id: 1,
          name: "Mercury",
          orbitalPeriodInDays: 88,
          lightFromSunInSec: 193,
          meanTempInC: 167,
          radius: 2439.7,
          massInRelationToEarth: 0.055,
          gravityInRelationToEarth: 0.38),
      AstronomyPlanetProperties(
          id: 2,
          name: "Venus",
          orbitalPeriodInDays: 225,
          lightFromSunInSec: 360,
          meanTempInC: 464,
          radius: 6052,
          massInRelationToEarth: 0.815,
          gravityInRelationToEarth: 0.9),
      AstronomyPlanetProperties(
          id: 3,
          name: "Terra",
          orbitalPeriodInDays: 365,
          lightFromSunInSec: 499,
          meanTempInC: 15,
          radius: 6371,
          massInRelationToEarth: 1,
          gravityInRelationToEarth: 1),
      AstronomyPlanetProperties(
          id: 4,
          name: "Mars",
          orbitalPeriodInDays: 687,
          lightFromSunInSec: 759,
          meanTempInC: -65,
          radius: 3389,
          massInRelationToEarth: 0.107,
          gravityInRelationToEarth: 0.38),
      AstronomyPlanetProperties(
          id: 5,
          name: "Jupiter",
          orbitalPeriodInDays: 4332,
          lightFromSunInSec: 2595,
          meanTempInC: -110,
          radius: 69911,
          massInRelationToEarth: 317.8,
          gravityInRelationToEarth: 2.4),
      AstronomyPlanetProperties(
          id: 6,
          name: "Saturn",
          orbitalPeriodInDays: 10747,
          lightFromSunInSec: 4759,
          meanTempInC: -140,
          radius: 58232,
          massInRelationToEarth: 95.16,
          gravityInRelationToEarth: 0.9),
      AstronomyPlanetProperties(
          id: 7,
          name: "Uranus",
          orbitalPeriodInDays: 30589,
          lightFromSunInSec: 9575,
          meanTempInC: -195,
          radius: 25362,
          massInRelationToEarth: 14.54,
          gravityInRelationToEarth: 0.9),
      AstronomyPlanetProperties(
          id: 8,
          name: "Neptune",
          orbitalPeriodInDays: 59800,
          lightFromSunInSec: 14998,
          meanTempInC: -200,
          radius: 24622,
          massInRelationToEarth: 17.15,
          gravityInRelationToEarth: 1.1),
      AstronomyPlanetProperties(
          id: 9,
          name: "Pluto",
          orbitalPeriodInDays: 90560,
          lightFromSunInSec: 19680,
          meanTempInC: -225,
          radius: 1188,
          massInRelationToEarth: 0.0022,
          gravityInRelationToEarth: 0.07),
      AstronomyPlanetProperties(
          id: 10,
          name: "Moon",
          orbitalPeriodInDays: 0,
          lightFromSunInSec: 0,
          meanTempInC: -20,
          radius: 1737,
          massInRelationToEarth: 0.012,
          gravityInRelationToEarth: 0.16),
    ];

    return singleton;
  }

  AstronomyGameQuestionConfig.internal();

  @override
  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode {
    Map<QuestionCategoryDifficultyWithPrefixCode, String> res = HashMap();

    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat1, prefixCode: 0),
        () => "Planet radius compared to earth radius");
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat2, prefixCode: 0),
        () => "How much does 1 kg weigh on this planet?");
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat3, prefixCode: 0),
        () => "Planet radius compared to earth radius");
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat4, prefixCode: 0),
        () => "Planet radius compared to earth radius");
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat5, prefixCode: 0),
        () => "Planet radius compared to earth radius");
    res.putIfAbsent(
        QuestionCategoryDifficultyWithPrefixCode(category: cat6, prefixCode: 0),
        () => "Planet radius compared to earth radius");

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
