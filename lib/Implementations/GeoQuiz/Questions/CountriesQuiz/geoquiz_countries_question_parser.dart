import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_all_questions.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';

import '../geoquiz_country_utils.dart';

class GeoQuizCountriesQuestionParser extends QuestionParser {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final GeoQuizAllQuestions _allQuestions = GeoQuizAllQuestions();

  static final GeoQuizCountriesQuestionParser singleton =
      GeoQuizCountriesQuestionParser.internal();

  factory GeoQuizCountriesQuestionParser() {
    return singleton;
  }

  GeoQuizCountriesQuestionParser.internal();

  //We return a list in case of multiple correct answers
  // but for this case there is only one correct answer
  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    return [questionString.split(":")[1].trim()];
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    return questionRawString.split(":")[0].trim();
  }

  Set<String> getAllPossibleAnswersForQuestion(
      String currentCountry,
      Set<String> correctAnswers,
      Set<String> alreadyUsedCountries,
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
    countryRangeIndexes.removeAll(alreadyUsedCountries.map((e) => _geoQuizCountryUtils.getCountryIndexForName(e)));
    countryRangeIndexes.removeAll(correctAnswers.map((e) => _geoQuizCountryUtils.getCountryIndexForName(e)));

    var correctAnswersList = correctAnswers.toList();
    correctAnswersList.shuffle();
    possibleAnswersResult.add(correctAnswersList.first);
    while (possibleAnswersResult.length <
            nrOfPossibleAnswers &&
        countryRangeIndexes.isNotEmpty) {
      var firstIndex = countryRangeIndexes.first;
      possibleAnswersResult
          .add(_geoQuizCountryUtils.getCountryNameForIndex(firstIndex));
      countryRangeIndexes.remove(firstIndex);
    }

    return possibleAnswersResult;
  }
}
