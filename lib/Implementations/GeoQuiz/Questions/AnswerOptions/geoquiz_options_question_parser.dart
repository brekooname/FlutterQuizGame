import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../geoquiz_country_utils.dart';

class GeoQuizOptionsQuestionParser
    extends QuestionParser<GeoQuizQuestionCollectorService> {
  final GeoQuizGameQuestionConfig _gameQuestionConfig =
      GeoQuizGameQuestionConfig();
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final GeoQuizAllQuestions _allQuestions = GeoQuizAllQuestions();

  static final GeoQuizOptionsQuestionParser singleton =
      GeoQuizOptionsQuestionParser.internal();

  factory GeoQuizOptionsQuestionParser() {
    return singleton;
  }

  GeoQuizOptionsQuestionParser.internal();

  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    List<String> result;
    if (_geoQuizCountryUtils.isStatsCategory(question.category)
        //
        ||
        _geoQuizCountryUtils
            .isCountryIndexesQuestionsCategory(question.category)
        //
        ||
        isCategoryFindAnswerByQuestionName(question)) {
      var countryAnswer = question.rawString.split(":")[0];
      if (_geoQuizCountryUtils
          .isGeographicalRegionOrEmpireCategory(question.category)) {
        result = [countryAnswer];
      } else {
        result = [
          _geoQuizCountryUtils.getCountryNameForIndex(countryAnswer.parseToInt)
        ];
      }
    } else {
      result = getCountryNamesFromQuestionOptions(question);
      var maxNrOfCorrectAnswerToUse = 9;
      result = result.length > maxNrOfCorrectAnswerToUse
          ? result.sublist(0, maxNrOfCorrectAnswerToUse)
          : result;
    }
    var gameQuestionConfig = GeoQuizGameQuestionConfig();
    if ([gameQuestionConfig.diff0, gameQuestionConfig.diff1]
        .contains(question.difficulty)) {
      result.shuffle();
      result = [result.first];
    }

    return result;
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    String result;
    if (_geoQuizCountryUtils.isStatsCategory(question.category) ||
        _geoQuizCountryUtils.isFlagsOrMapsCategory(question.category)) {
      result = "";
    } else if (isCategoryFindAnswerByQuestionName(question)) {
      var options = getCountryNamesFromQuestionOptions(question);
      var maxCountriesToShowInQuestion = 10;
      result = (options.length > maxCountriesToShowInQuestion
              ? options.sublist(0, maxCountriesToShowInQuestion)
              : options)
          .join(", ");
    } else if (_geoQuizCountryUtils
        .isGeographicalRegionOrEmpireCategory(question.category)) {
      result = question.rawString.split(":")[0];
    } else if (question.category == _gameQuestionConfig.cat6) {
      result = _geoQuizCountryUtils
          .getCapitalNameForCountryIndex(question.rawString.parseToInt);
    } else {
      result = _geoQuizCountryUtils.getCountryNameForIndex(
          question.rawString.split(":")[0].trim().parseToInt);
    }
    return result;
  }

  List<String> getCountryNamesFromQuestionOptions(Question question) {
    var list = question.rawString
        .split(":")[1]
        .trim()
        .split(",")
        .map((e) => e.parseToInt)
        .toList();

    var result = questionCollectorService
        .sortCountryIndexListAfterRankedCountries(list)
        .map((e) => _geoQuizCountryUtils.getCountryNameForIndex(e))
        .toList();
    return result;
  }

  bool isCategoryFindAnswerByQuestionName(Question question) {
    //find country name if the neighbours are displayed
    return _gameQuestionConfig.cat2 == question.category &&
            _gameQuestionConfig.diff1 == question.difficulty
        //
        ||
        //find geo region if the contained countries are displayed
        _gameQuestionConfig.cat3 == question.category &&
            _gameQuestionConfig.diff1 == question.difficulty
        //
        ||
        //find empire if the contained countries are displayed
        _gameQuestionConfig.cat4 == question.category &&
            _gameQuestionConfig.diff2 == question.difficulty;
  }

  Set<String> getAnswerOptionsForStatisticsQuestion(QuestionCategory category,
      String currentCountry, int nrOfPossibleAnswers) {
    Set<String> possibleAnswersResult = {currentCountry};
    var numberOfQuestionsForStatisticsCategory =
        GeoQuizQuestionCollectorService.numberOfQuestionsForStatisticsCategory;
    List<int> allWrongOptions = questionCollectorService
        .getStatsQuestions(category)
        .sublist(numberOfQuestionsForStatisticsCategory,
            numberOfQuestionsForStatisticsCategory + 10)
        .map((e) => e.rawString.split(":")[0].parseToInt)
        .toList();
    allWrongOptions.shuffle();

    while (possibleAnswersResult.length < nrOfPossibleAnswers &&
        allWrongOptions.isNotEmpty) {
      int firstIndex = allWrongOptions.first;
      possibleAnswersResult
          .add(_geoQuizCountryUtils.getCountryNameForIndex(firstIndex));
      allWrongOptions.remove(firstIndex);
    }

    return possibleAnswersResult;
  }

  Set<String> getDependentAnswerOptionsForQuestion(Question question,
      String correctAnswerForCurrentQuestion, int nrOfPossibleAnswers) {
    List<Question> allQuestionsForCategory =
        questionCollectorService.getAllQuestionsForCategory(question.category);

    Set<String> possibleAnswersResult = {};
    possibleAnswersResult.add(correctAnswerForCurrentQuestion);

    int i = 0;
    while (possibleAnswersResult.length < nrOfPossibleAnswers &&
        allQuestionsForCategory.length >= i + 1) {
      String correctAnswerFromString =
          allQuestionsForCategory[i].rawString.split(":")[0];

      if (correctAnswerForCurrentQuestion != correctAnswerFromString) {
        possibleAnswersResult.add(correctAnswerFromString);
      }

      i++;
    }

    return possibleAnswersResult;
  }

  Set<String> getAnswerOptionsInCountryRange(
      String currentCountryToSearchRange,
      Set<String> allCorrectAnswers,
      Set<String> countriesAlreadyUsed,
      int nrOfCorrectAnswerToUse,
      int nrOfAnswerOptions) {
    Set<String> possibleAnswersResult = {};

    int currentCountryIndex = _geoQuizCountryUtils
        .getCountryIndexForName(currentCountryToSearchRange);

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
    countryRangeIndexes.removeAll(countriesAlreadyUsed
        .map((e) => _geoQuizCountryUtils.getCountryIndexForName(e)));
    countryRangeIndexes.removeAll(allCorrectAnswers
        .map((e) => _geoQuizCountryUtils.getCountryIndexForName(e)));

    var correctAnswersList = allCorrectAnswers.toList();
    correctAnswersList.shuffle();
    while (possibleAnswersResult.length < nrOfCorrectAnswerToUse &&
        correctAnswersList.isNotEmpty) {
      var firstCorrectAnswer = correctAnswersList.first;
      possibleAnswersResult.add(firstCorrectAnswer);
      correctAnswersList.remove(firstCorrectAnswer);
    }

    while (possibleAnswersResult.length < nrOfAnswerOptions &&
        countryRangeIndexes.isNotEmpty) {
      var firstIndex = countryRangeIndexes.first;
      possibleAnswersResult
          .add(_geoQuizCountryUtils.getCountryNameForIndex(firstIndex));
      countryRangeIndexes.remove(firstIndex);
    }

    return possibleAnswersResult;
  }
}
