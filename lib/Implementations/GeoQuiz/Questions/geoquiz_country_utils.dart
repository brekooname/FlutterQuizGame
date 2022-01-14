import 'dart:collection';
import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'AllContent/geoquiz_all_questions.dart';

class GeoQuizCountryUtils {
  final GeoQuizGameQuestionConfig _questionConfig = GeoQuizGameQuestionConfig();
  late GeoQuizAllQuestions _geoQuizAllQuestions;
  late Map<int, List<String>> allSynonyms = HashMap();

  static final GeoQuizCountryUtils singleton = GeoQuizCountryUtils.internal();

  factory GeoQuizCountryUtils() {
    GeoQuizAllQuestions geoQuizAllQuestions = GeoQuizAllQuestions();
    singleton._geoQuizAllQuestions = geoQuizAllQuestions;
    for (var val in geoQuizAllQuestions.allSynonyms) {
      var split = val.split(":");
      singleton.allSynonyms.putIfAbsent(split[0].parseToInt, () => [split[1]]);
    }
    return singleton;
  }

  GeoQuizCountryUtils.internal();

  String getCountryName(String questionRawString) {
    int index = questionRawString.split(":")[0].parseToInt;
    return getCountryNameForIndex(index);
  }

  String getCountryNameForIndex(int countryIndex) {
    return _geoQuizAllQuestions.allCountries.elementAt(countryIndex);
  }

  String getCapitalNameForCountryIndex(int countryIndex) {
    return _geoQuizAllQuestions.allCapitals.elementAt(_geoQuizAllQuestions
        .allCapitalIndexes
        .indexOf(countryIndex.toString()));
  }

  int getCountryIndexForName(String countryName) {
    return _geoQuizAllQuestions.allCountries.indexOf(countryName);
  }

  List<String> getCountryNamesForOptions(String questionRawString) {
    return questionRawString
        .split(":")[1]
        .split(",")
        .map((e) => getCountryNameForIndex(e.parseToInt))
        .toList();
  }

  bool isStatsCategory(QuestionCategory category) {
    return statsCategories.contains(category);
  }

  bool isFlagsOrMapsCategory(QuestionCategory category) {
    return flagsOrMapsCategory.contains(category);
  }

  bool isCountryIndexesQuestionsCategory(QuestionCategory category) {
    return countryIndexesQuestionsCategory.contains(category);
  }

  bool isGeographicalRegionOrEmpireCategory(QuestionCategory category) {
    return geographicalRegionOrEmpireCategory.contains(category);
  }

  List<QuestionCategory> get statsCategories =>
      [_questionConfig.cat0, _questionConfig.cat1];

  List<QuestionCategory> get geographicalRegionOrEmpireCategory =>
      [_questionConfig.cat3, _questionConfig.cat4];

  List<QuestionCategory> get flagsOrMapsCategory =>
      [_questionConfig.cat7, _questionConfig.cat9];

  List<QuestionCategory> get countryIndexesQuestionsCategory =>
      [_questionConfig.cat6, _questionConfig.cat7, _questionConfig.cat9];
}
