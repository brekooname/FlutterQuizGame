import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'AllContent/geoquiz_all_questions.dart';

class GeoQuizCountryUtils {
  final GeoQuizGameQuestionConfig _questionConfig = GeoQuizGameQuestionConfig();
  late GeoQuizAllQuestions _geoQuizAllQuestions;

  static final GeoQuizCountryUtils singleton = GeoQuizCountryUtils.internal();

  factory GeoQuizCountryUtils() {
    GeoQuizAllQuestions geoQuizAllQuestions = GeoQuizAllQuestions();
    singleton._geoQuizAllQuestions = geoQuizAllQuestions;
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

  bool isCategoryWithImageQuestions(QuestionCategory category) {
    return categoriesWithImageQuestions.contains(category);
  }

  bool isCategoryWithMultipleCorrectAnswers(QuestionCategory category) {
    return categoriesWithMultipleCorrectAnswers.contains(category);
  }

  bool isGeographicalRegionOrEmpireCategory(QuestionCategory category) {
    return geographicalRegionOrEmpireCategory.contains(category);
  }

  List<QuestionCategory> get statsCategories =>
      [_questionConfig.cat0, _questionConfig.cat1];

  List<QuestionCategory> get geographicalRegionOrEmpireCategory =>
      [_questionConfig.cat3, _questionConfig.cat4];

  List<QuestionCategory> get categoriesWithMultipleCorrectAnswers =>
      [_questionConfig.cat2, _questionConfig.cat3, _questionConfig.cat4];

  List<QuestionCategory> get categoriesWithImageQuestions => [
        _questionConfig.cat5,
        _questionConfig.cat7,
        _questionConfig.cat8,
        _questionConfig.cat9
      ];

  List<QuestionCategory> get flagsOrMapsCategory =>
      [_questionConfig.cat7, _questionConfig.cat9];

  List<QuestionCategory> get countryIndexesQuestionsCategory =>
      [_questionConfig.cat6, _questionConfig.cat7, _questionConfig.cat9];
}
