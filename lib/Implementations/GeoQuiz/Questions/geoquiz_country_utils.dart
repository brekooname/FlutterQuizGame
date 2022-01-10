import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'AllContent/geoquiz_all_questions.dart';

class GeoQuizCountryUtils {
  final GeoQuizGameQuestionConfig _questionConfig = GeoQuizGameQuestionConfig();
  final GeoQuizAllQuestions _geoQuizAllQuestions = GeoQuizAllQuestions();
  late List<String> _allCountries;
  late Map<int, List<String>> allSynonyms = HashMap();

  static final GeoQuizCountryUtils singleton = GeoQuizCountryUtils.internal();

  factory GeoQuizCountryUtils() {
    singleton._allCountries = singleton._geoQuizAllQuestions.allCountries;
    for (var val in singleton._geoQuizAllQuestions.allSynonyms) {
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

  List<Question> getAllQuestionsForCriteria(
      QuestionCategory category, bool includeCriteria) {
    int? criteria = _questionConfig.categoriesWithStatsCriteria
        .getOrDefault<QuestionCategory, int?>(category, null);
    return criteria == null
        ? []
        : _geoQuizAllQuestions
            .getAllQuestionsForCategory(category)
            .where((element) {
            var statsValue = element.rawString.split(":")[1].parseToDouble;
            return includeCriteria
                ? statsValue >= criteria
                : statsValue < criteria;
          }).toList();
  }

  void filterStatsQuestionsAfterCriteria(List<Question> questions) {
    _questionConfig.categoriesWithStatsCriteria.forEach((cat, criteria) {
      questions.removeWhere((q) =>
          q.category == cat && q.rawString.split(":")[1].parseToDouble < criteria);
    });
  }

  bool isStatsCategory(QuestionCategory category) {
    return _questionConfig.categoriesWithStatsCriteria.keys.contains(category);
  }
}
