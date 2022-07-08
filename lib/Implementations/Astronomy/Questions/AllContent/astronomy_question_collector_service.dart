import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/AllContent/astronomy_all_questions.dart';

import '../../../../Game/Question/Model/question.dart';
import '../../../../Game/Question/Model/question_category.dart';
import '../../../../Game/Question/Model/question_difficulty.dart';

import 'dart:math';

class AstronomyQuestionCollectorService extends QuestionCollectorService<
    AstronomyAllQuestions, AstronomyGameQuestionConfig> {
  static final AstronomyQuestionCollectorService singleton =
      AstronomyQuestionCollectorService.internal();

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
      if (cat == gameQuestionConfig.cat0) {
        result.addAll(allQuestionsService.getAllQuestionsForCategory(cat));
      } else
      ////////////
      ////////////
      if (cat == gameQuestionConfig.cat1) {
        var qPlanets = gameQuestionConfig.planets
            .where((element) => element.radius != 0)
            .toList();
        for (AstronomyPlanetProperties p in qPlanets) {
          var correctAnswer = _getRadius(p.id);
          var opts = getRandomOptsForQuestion(
              qPlanets.map((e) => _getRadius(e.id)).toList(), correctAnswer);
          result.add(Question(
              p.id,
              gameQuestionConfig.diff0,
              cat,
              "Radius::" +
                  opts.join("##") +
                  "::" +
                  opts.indexOf(correctAnswer).toString()));
        }
      }
    }
    return result;
  }

  List<String> getRandomOptsForQuestion(
      List<String> allOptions, String correctAnswer) {
    var validOptions = allOptions.toSet();
    validOptions.remove(correctAnswer);
    List<String> validOptionsList = validOptions.toList();
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
    if (hours > 0) {
      formattedTime += hours.toString() + "h ";
    }

    if (minutes > 0) {
      formattedTime += minutes.toString() + "min ";
    }

    if (seconds > 0 && !formattedTime.contains("h")) {
      formattedTime += seconds.toString() + "s";
    }

    return formattedTime;
  }

  String _getGravityInRelationToEarth(int id) {
    double gravityInRelationToEarth = _getById(id).gravityInRelationToEarth;
    String res = gravityInRelationToEarth.toStringAsFixed(1) + " kg";
    if (gravityInRelationToEarth < 1) {
      res = (gravityInRelationToEarth * 1000).toStringAsFixed(1) + " g";
    }
    return res;
  }

  String _getOrbitalPeriod(int id) {
    int orbitalPeriodInDays = _getById(id).orbitalPeriodInDays;
    String res = orbitalPeriodInDays.toString() + " days";
    if (orbitalPeriodInDays > 999) {
      res = (orbitalPeriodInDays / 365).round().toString() + " years";
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
    return res + " x ";
  }

  AstronomyPlanetProperties _getEarth() => _getById(3);
}
