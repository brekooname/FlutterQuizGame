import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/test_util.dart';

GeoQuizCountryUtils geoQuizCountryUtils = GeoQuizCountryUtils();
GeoQuizGameQuestionConfig questionConfig = GeoQuizGameQuestionConfig();
GeoQuizQuestionCollectorService collectorService =
    GeoQuizQuestionCollectorService();

void main() {
  testWidgets('GeoQuizQuestionCollectorService is tested',
      (WidgetTester tester) async {
    await TestUtil.initApp(Language.en, "geoquiz", tester);

    // testStatisticsQuestions(
    //     questionConfig.cat0, questionConfig.diff0, questionConfig.diff1);
    // testStatisticsQuestions(
    //     questionConfig.cat1, questionConfig.diff1, questionConfig.diff0);
    // testNeighbours();
    // testGeoRegionAndEmpire();
    // testLandmarksAndNaturalWonders();
    testCapitalsFlagsMaps();
  });
}

void testCapitalsFlagsMaps() {
  for (QuestionCategory category in [
    questionConfig.cat6,
    questionConfig.cat7,
    questionConfig.cat9
  ]) {
    debugPrint("");
    for (QuestionDifficulty difficulty in questionConfig.difficulties) {
      debugPrint("===> FLAGS CAPITALS MAPS FOR DIFF " +
          difficulty.name +
          " and cat " +
          category.name +
          "\n");
      var result = collectorService.getAllQuestionsForCategoryAndDifficulty(
          category, difficulty);
      var qStrings = result.map((e) =>
          geoQuizCountryUtils.getCountryNameForIndex(e.rawString.parseToInt));
      for (String s in qStrings) {
        debugPrint(s);
      }
      debugPrint("\n\n");
      testCountryRanking(
          result.length,
          CategoryDifficulty(category, difficulty),
          qStrings,
          expectedResultsForFlagsCapitalsMaps());
    }
  }
}

Map<CategoryDifficulty, ExpectedRankedCountries>
    expectedResultsForFlagsCapitalsMaps() {
  return {
    CategoryDifficulty(questionConfig.cat6, questionConfig.diff0):
        ExpectedRankedCountries(
            30, 35, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat6, questionConfig.diff1):
        ExpectedRankedCountries(
            30, 35, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat6, questionConfig.diff2):
        ExpectedRankedCountries(
            45, 50, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat6, questionConfig.diff3):
        ExpectedRankedCountries(
            45, 50, "Germany", "Romania", "Honduras", "Andorra"),
    //////////////////////////////////////////////////////////////
    CategoryDifficulty(questionConfig.cat7, questionConfig.diff0):
        ExpectedRankedCountries(
            30, 35, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat7, questionConfig.diff1):
        ExpectedRankedCountries(
            30, 35, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat7, questionConfig.diff2):
        ExpectedRankedCountries(
            50, 55, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat7, questionConfig.diff3):
        ExpectedRankedCountries(
            50, 55, "Germany", "Romania", "Honduras", "Andorra"),
    //////////////////////////////////////////////////////////////
    CategoryDifficulty(questionConfig.cat9, questionConfig.diff0):
        ExpectedRankedCountries(
            20, 25, "Germany", "Romania", "Uzbekistan", "Honduras"),
    CategoryDifficulty(questionConfig.cat9, questionConfig.diff1):
        ExpectedRankedCountries(
            20, 25, "Germany", "Romania", "Uzbekistan", "Honduras"),
    CategoryDifficulty(questionConfig.cat9, questionConfig.diff2):
        ExpectedRankedCountries(
            30, 35, "Germany", "Romania", "Uzbekistan", "Honduras"),
    CategoryDifficulty(questionConfig.cat9, questionConfig.diff3):
        ExpectedRankedCountries(
            30, 35, "Germany", "Romania", "Uzbekistan", "Honduras"),
  };
}

void testLandmarksAndNaturalWonders() {
  for (QuestionCategory category in [
    questionConfig.cat5,
    questionConfig.cat8
  ]) {
    for (QuestionDifficulty difficulty in questionConfig.difficulties) {
      var result = collectorService.getAllQuestionsForCategoryAndDifficulty(
          category, difficulty);
      expect(result.length > 5, true);
      for (Question q in result) {
        debugPrint(q.rawString);
      }
    }
  }
}

void testGeoRegionAndEmpire() {
  List<Question> result =
      collectorService.getAllQuestionsForCategoryAndDifficulty(
          questionConfig.cat3, questionConfig.diff0);
  expect(result.length > 10, true);
  debugPrint("===> GEO REGION \n");
  for (Question q in result) {
    debugPrint(q.rawString);
  }
  result = collectorService.getAllQuestionsForCategoryAndDifficulty(
      questionConfig.cat3, questionConfig.diff3);
  expect(result.isEmpty, true);

  result = collectorService.getAllQuestionsForCategoryAndDifficulty(
      questionConfig.cat4, questionConfig.diff2);
  expect(result.length > 10, true);
  debugPrint("===> EMPIRE \n");
  for (Question q in result) {
    debugPrint(q.rawString);
  }
  result = collectorService.getAllQuestionsForCategoryAndDifficulty(
      questionConfig.cat4, questionConfig.diff0);
  expect(result.isEmpty, true);
}

void testNeighbours() {
  testNeighboursDiff(questionConfig.diff0);
  testNeighboursDiff(questionConfig.diff1);
  testNeighboursDiff(questionConfig.diff2);
  testNeighboursDiff(questionConfig.diff3);
}

void testNeighboursDiff(QuestionDifficulty difficulty) {
  List<Question> result = collectorService
      .getAllQuestionsForCategoryAndDifficulty(questionConfig.cat2, difficulty);
  debugPrint("===> NEIGHBOURS FOR DIFF " + difficulty.name + "\n");
  var qStrings = result.map((e) => geoQuizCountryUtils
      .getCountryNameForIndex(e.rawString.split(":")[0].parseToInt));
  for (String s in qStrings) {
    debugPrint(s);
  }
  debugPrint("\n\n");

  //because we have multiple playing types depending on the difficulty level
  //here we show only easy countries diff0
  testCountryRanking(result.length,
      CategoryDifficulty(questionConfig.cat2, questionConfig.diff0), qStrings, {
    CategoryDifficulty(questionConfig.cat2, questionConfig.diff0):
        ExpectedRankedCountries(
            30, 45, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat2, questionConfig.diff1):
        ExpectedRankedCountries(
            30, 45, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat2, questionConfig.diff2):
        ExpectedRankedCountries(
            45, 50, "Germany", "Romania", "Honduras", "Andorra"),
    CategoryDifficulty(questionConfig.cat2, questionConfig.diff3):
        ExpectedRankedCountries(
            45, 50, "Germany", "Romania", "Honduras", "Andorra"),
  });
}

void testCountryRanking(
    int resultLength,
    CategoryDifficulty categoryDifficulty,
    Iterable<String> countryNames,
    Map<CategoryDifficulty, ExpectedRankedCountries>
        expectedResultsForRangedCountryList) {
  var expectedRes = expectedResultsForRangedCountryList
      .get<CategoryDifficulty, ExpectedRankedCountries>(categoryDifficulty)!;
  expect(
      resultLength >= expectedRes.expectedMinRes &&
          resultLength <= expectedRes.expectedMaxRes,
      true);
  if (categoryDifficulty.difficulty == questionConfig.diff0) {
    expect(countryNames.contains(expectedRes.exDiff0Country), true);
    expect(countryNames.contains(expectedRes.exDiff1Country), false);
    expect(countryNames.contains(expectedRes.exDiff2Country), false);
    expect(countryNames.contains(expectedRes.exDiff3Country), false);
  } else if (categoryDifficulty.difficulty == questionConfig.diff1) {
    expect(countryNames.contains(expectedRes.exDiff0Country), false);
    expect(countryNames.contains(expectedRes.exDiff1Country), true);
    expect(countryNames.contains(expectedRes.exDiff2Country), false);
    expect(countryNames.contains(expectedRes.exDiff3Country), false);
  } else if (categoryDifficulty.difficulty == questionConfig.diff2) {
    expect(countryNames.contains(expectedRes.exDiff0Country), false);
    expect(countryNames.contains(expectedRes.exDiff1Country), false);
    expect(countryNames.contains(expectedRes.exDiff2Country), true);
    expect(countryNames.contains(expectedRes.exDiff3Country), false);
  } else if (categoryDifficulty.difficulty == questionConfig.diff3) {
    expect(countryNames.contains(expectedRes.exDiff0Country), false);
    expect(countryNames.contains(expectedRes.exDiff1Country), false);
    expect(countryNames.contains(expectedRes.exDiff2Country), false);
    expect(countryNames.contains(expectedRes.exDiff3Country), true);
  }
}

void testStatisticsQuestions(
    QuestionCategory category,
    QuestionDifficulty difficultyToFind,
    QuestionDifficulty difficultyToNotFind) {
  List<Question> result = collectorService
      .getAllQuestionsForCategoryAndDifficulty(category, difficultyToFind);
  for (Question s in result) {
    debugPrint(geoQuizCountryUtils
        .getCountryNameForIndex(s.rawString.split(":")[0].parseToInt));
  }
  expect(result.length,
      GeoQuizQuestionCollectorService.numberOfQuestionsForStatisticsCategory);
  result = collectorService.getAllQuestionsForCategoryAndDifficulty(
      category, difficultyToNotFind);
  expect(result.length, 0);
  debugPrint("\n\n");
}

class ExpectedRankedCountries {
  int expectedMinRes;
  int expectedMaxRes;
  String exDiff0Country;
  String exDiff1Country;
  String exDiff2Country;
  String exDiff3Country;

  ExpectedRankedCountries(
      this.expectedMinRes,
      this.expectedMaxRes,
      this.exDiff0Country,
      this.exDiff1Country,
      this.exDiff2Country,
      this.exDiff3Country);
}
