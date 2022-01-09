import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_all_questions.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../geoquiz_country_utils.dart';

class GeoQuizCountriesMultipleOptionsQuestionParser extends QuestionParser {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final GeoQuizAllQuestions _allQuestions = GeoQuizAllQuestions();

  static final GeoQuizCountriesMultipleOptionsQuestionParser singleton =
      GeoQuizCountriesMultipleOptionsQuestionParser.internal();

  factory GeoQuizCountriesMultipleOptionsQuestionParser() {
    return singleton;
  }

  GeoQuizCountriesMultipleOptionsQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    return questionString
        .split(":")[1]
        .trim()
        .split(",")
        .map((e) => _geoQuizCountryUtils.getCountryNameForIndex(e.parseToInt))
        .toList();
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    return _geoQuizCountryUtils.getCountryNameForIndex(
        questionRawString.split(":")[0].trim().parseToInt);
  }

  Set<String> getAllPossibleAnswersForQuestion(
      String currentCountry,
      Set<String> correctAnswers,
      Set<String> alreadyUsedCountries,
      bool useAllCorrectAnswersAsOptions,
      int nrOfPossibleAnswers) {
    Set<String> possibleAnswersResult = Set();

    int currentCountryIndex =
        _geoQuizCountryUtils.getCountryIndexForName(currentCountry);

    CountryRanges countryRanges = _allQuestions.allCountryRanges
        .where((e) =>
            e.maxStart <= currentCountryIndex &&
            e.maxEnd >= currentCountryIndex)
        .first;

    List<int> countryRangeIndexes = [];
    for (int i = countryRanges.maxStart; i <= countryRanges.maxEnd; i++) {
      countryRangeIndexes.add(i);
    }

    countryRangeIndexes.shuffle();
    countryRangeIndexes.remove(currentCountryIndex);
    countryRangeIndexes.removeAll(alreadyUsedCountries
        .map((e) => _geoQuizCountryUtils.getCountryIndexForName(e)));
    countryRangeIndexes.removeAll(correctAnswers
        .map((e) => _geoQuizCountryUtils.getCountryIndexForName(e)));

    if (useAllCorrectAnswersAsOptions) {
      possibleAnswersResult.addAll(correctAnswers);
    } else {
      var correctAnswersList = correctAnswers.toList();
      correctAnswersList.shuffle();
      possibleAnswersResult.add(correctAnswersList.first);
    }
    while (possibleAnswersResult.length < nrOfPossibleAnswers &&
        countryRangeIndexes.isNotEmpty) {
      var firstIndex = countryRangeIndexes.first;
      possibleAnswersResult
          .add(_geoQuizCountryUtils.getCountryNameForIndex(firstIndex));
      countryRangeIndexes.remove(firstIndex);
    }

    return possibleAnswersResult;
  }
}
