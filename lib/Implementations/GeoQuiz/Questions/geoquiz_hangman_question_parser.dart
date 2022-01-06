import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'AllContent/geoquiz_all_questions.dart';

class GeoQuizHangmanQuestionParser extends QuestionParser {
  late List<String> allCountries;
  late Map<int, List<String>> allSynonyms = HashMap();
  static final GeoQuizHangmanQuestionParser singleton =
      GeoQuizHangmanQuestionParser.internal();

  factory GeoQuizHangmanQuestionParser() {
    var geoQuizAllQuestions = GeoQuizAllQuestions();
    singleton.allCountries = geoQuizAllQuestions.allCountries;
    for (var val in geoQuizAllQuestions.allSynonyms) {
      var split = val.split(":");
      singleton.allSynonyms.putIfAbsent(split[0].parseToInt, () => [split[1]]);
    }
    return singleton;
  }

  GeoQuizHangmanQuestionParser.internal();

  String getCountryName(String questionRawString) {
    int index = questionRawString.split(":")[0].parseToInt;
    return allCountries.elementAt(index);
  }

  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    throw UnimplementedError();
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    throw UnimplementedError();
  }
}
