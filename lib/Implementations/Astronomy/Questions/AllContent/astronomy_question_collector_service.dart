import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/AllContent/astronomy_all_questions.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';

import '../../../../Game/Question/Model/category_difficulty.dart';
import '../../../../Game/Question/Model/question.dart';
import '../../../../Game/Question/Model/question_category.dart';
import '../../../../Game/Question/Model/question_difficulty.dart';

class AstronomyQuestionCollectorService extends QuestionCollectorService<
    AstronomyAllQuestions, AstronomyGameQuestionConfig> with LabelMixin {
  final AstronomyCampaignLevelService _campaignLevelService =
      AstronomyCampaignLevelService();
  static final AstronomyQuestionCollectorService singleton =
      AstronomyQuestionCollectorService.internal();

  final Map<CategoryDifficulty, int> _totalNrOfQuestionsForCategoryDifficulty =
      HashMap();

  Map<CategoryDifficulty, int> get totalNrOfQuestionsForCategoryDifficulty {
    if (_totalNrOfQuestionsForCategoryDifficulty.isEmpty) {
      initTotalQuestions();
    }
    return _totalNrOfQuestionsForCategoryDifficulty;
  }

  void initTotalQuestions() {
    for (QuestionCategory cat in gameQuestionConfig.categories) {
      for (QuestionDifficulty diff in gameQuestionConfig.difficulties) {
        int nrOfQuestions =
            getAllQuestions(difficulties: [diff], categories: [cat]).length;
        _totalNrOfQuestionsForCategoryDifficulty.putIfAbsent(
            CategoryDifficulty(cat, diff), () => nrOfQuestions);
      }
    }
  }

  factory AstronomyQuestionCollectorService() {
    return singleton;
  }

  AstronomyQuestionCollectorService.internal();

  @override
  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> result = [];
    for (QuestionCategory cat in categories ?? gameQuestionConfig.categories) {
      ////////////
      ////////////
      if (_campaignLevelService.isPlanetsGameType(
          _campaignLevelService.findGameTypeForCategory(cat))) {
        var qPlanets = gameQuestionConfig.planets
            .where((planet) => _getPlanetProperty(cat, planet, true) != "0")
            .toList();
        for (AstronomyPlanetProperties planet in qPlanets) {
          var correctAnswer = _getPlanetProperty(cat, planet, false);
          var opts = getRandomOptsForQuestion(
              qPlanets.map((e) => _getPlanetProperty(cat, e, false)).toList(),
              correctAnswer);
          result.add(createPlanetPropertyQuestion(
              planet.id, "", cat, opts, correctAnswer));
        }
      }
      ////////////
      ////////////
      else if (cat == gameQuestionConfig.cat16) {
        result.addAll(allQuestionsService
            .getAllQuestionsForCategory(gameQuestionConfig.cat0)
            .map((e) => Question(
                e.index,
                gameQuestionConfig.diff0,
                cat,
                DependentAnswersQuestionParser.formRawQuestion(
                    "", e.questionToBeDisplayed, ""))));
      }
      ////////////
      ////////////
      else {
        result.addAll(allQuestionsService.getAllQuestionsForCategory(cat));
      }
    }
    return result;
  }

  String _getPlanetProperty(QuestionCategory cat,
      AstronomyPlanetProperties planet, bool rawProperty) {
    int planetId = planet.id;
    if (cat == gameQuestionConfig.cat1) {
      return rawProperty ? planet.radius.toString() : _getRadius(planetId);
    } else if (cat == gameQuestionConfig.cat2) {
      return rawProperty
          ? planet.gravityInRelationToEarth.toString()
          : _getGravityInRelationToEarth(planetId);
    } else if (cat == gameQuestionConfig.cat3) {
      return rawProperty
          ? planet.lightFromSunInSec.toString()
          : _getLightFromSunInSec(planetId);
    } else if (cat == gameQuestionConfig.cat4) {
      return rawProperty
          ? planet.massInRelationToEarth.toString()
          : _getMassInRelationToEarth(planetId);
    } else if (cat == gameQuestionConfig.cat5) {
      return rawProperty
          ? planet.orbitalPeriodInDays.toString()
          : _getOrbitalPeriod(planetId);
    } else if (cat == gameQuestionConfig.cat6) {
      return rawProperty
          ? planet.meanTempInC.toString()
          : _getMeanTemp(planetId);
    }
    throw AssertionError(
        "Category " + cat.name + " has no planet property configured!");
  }

  Question createPlanetPropertyQuestion(int planetId, String question,
      QuestionCategory cat, List<String> opts, String correctAnswer) {
    return Question(
        planetId,
        gameQuestionConfig.diff0,
        cat,
        question +
            "::" +
            opts.join("##") +
            "::" +
            opts.indexOf(correctAnswer).toString());
  }

  List<String> getRandomOptsForQuestion(
      List<String> allOptions, String correctAnswer) {
    var validOptions = allOptions.toSet();
    validOptions.remove(correctAnswer);
    List<String> validOptionsList = validOptions.toList();
    validOptionsList.shuffle();
    var res = [
      validOptionsList.elementAt(0),
      validOptionsList.elementAt(1),
      validOptionsList.elementAt(2)
    ];
    res.add(correctAnswer);
    res.shuffle();
    return res;
  }

  AstronomyPlanetProperties _getById(int id) {
    return gameQuestionConfig.planets.firstWhere((element) => element.id == id);
  }

  String _getLightFromSunInSec(int id) {
    int timeInSeconds = _getById(id).lightFromSunInSec;
    int hours = timeInSeconds ~/ 3600;
    int secondsLeft = timeInSeconds - hours * 3600;
    int minutes = secondsLeft ~/ 60;
    int seconds = secondsLeft - minutes * 60;

    String formattedTime = "";
    bool containsHoursLabel = false;
    if (hours > 0) {
      formattedTime +=
          formatTextWithOneParam(label.l_param0_hours, hours.toString()) + " ";
      containsHoursLabel = true;
    }

    if (minutes > 0) {
      formattedTime += containsHoursLabel ? "\n" : "";
      formattedTime +=
          formatTextWithOneParam(label.l_param0_minutes, minutes.toString()) +
              " ";
    }

    if (seconds > 0 && !containsHoursLabel) {
      formattedTime += "\n" +
          formatTextWithOneParam(label.l_param0_seconds, seconds.toString());
    }

    return formattedTime;
  }

  String _getGravityInRelationToEarth(int id) {
    double gravityInRelationToEarth = _getById(id).gravityInRelationToEarth;
    String res = formatTextWithOneParam(
        label.l_param0_kg, gravityInRelationToEarth.toStringAsFixed(1));
    if (gravityInRelationToEarth < 1) {
      res = formatTextWithOneParam(label.l_param0_grams,
          (gravityInRelationToEarth * 1000).toStringAsFixed(1));
    }
    return res;
  }

  String _getOrbitalPeriod(int id) {
    int orbitalPeriodInDays = _getById(id).orbitalPeriodInDays;
    String res = formatTextWithOneParam(
        label.l_param0_days, orbitalPeriodInDays.toString());
    if (orbitalPeriodInDays > 999) {
      res = formatTextWithOneParam(
          label.l_param0_years, (orbitalPeriodInDays / 365).round().toString());
    }
    return res;
  }

  String _getRadius(int id) {
    return _formatDecimalValue(_getById(id).radius / _getEarth().radius);
  }

  String _getMassInRelationToEarth(int id) {
    return _formatDecimalValue(_getById(id).massInRelationToEarth);
  }

  String _getMeanTemp(int id) {
    return _getById(id).meanTempInC.toString() + " °C";
  }

  String _formatDecimalValue(double val) {
    String res;
    if (val >= 1) {
      res = val.round().toString();
    } else {
      res = val.toStringAsFixed(1);
      if (val < 0.009) {
        res = val.toStringAsFixed(3);
      } else if (val < 0.09) {
        res = val.toStringAsFixed(2);
      }
    }
    return res + " × ";
  }

  AstronomyPlanetProperties _getEarth() => _getById(3);
}
