import 'dart:collection';
import 'dart:core';

import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'AllContent/geoquiz_all_questions.dart';

class GeoQuizCountryUtils {
  final GeoQuizGameQuestionConfig _questionConfig = GeoQuizGameQuestionConfig();
  late List<String> _allCountries;
  late Map<int, List<String>> allSynonyms = HashMap();

  static final GeoQuizCountryUtils singleton = GeoQuizCountryUtils.internal();

  factory GeoQuizCountryUtils() {
    GeoQuizAllQuestions geoQuizAllQuestions = GeoQuizAllQuestions();
    singleton._allCountries = geoQuizAllQuestions.allCountries;
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
    return _allCountries.elementAt(countryIndex);
  }

  int getCountryIndexForName(String countryName) {
    return _allCountries.indexOf(countryName);
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

  List<QuestionCategory> get statsCategories =>
      [_questionConfig.cat0, _questionConfig.cat1];
}
