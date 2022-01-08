import 'dart:collection';

import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'AllContent/geoquiz_all_questions.dart';

class GeoQuizCountryUtils {
  late List<String> _allCountries;
  late Map<int, List<String>> allSynonyms = HashMap();

  static final GeoQuizCountryUtils singleton = GeoQuizCountryUtils.internal();

  factory GeoQuizCountryUtils() {
    var geoQuizAllQuestions = GeoQuizAllQuestions();
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
}
