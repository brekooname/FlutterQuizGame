import 'package:flutter/widgets.dart';
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
  test('GeoQuizQuestionCollectorService is tested', () async {
    await TestUtil.initApp(Language.en, "geoquiz");

    testStatisticsQuestions(
        questionConfig.cat0, questionConfig.diff0, questionConfig.diff1);
    testStatisticsQuestions(
        questionConfig.cat1, questionConfig.diff1, questionConfig.diff0);
    testNeighbours();
    testGeoRegionAndEmpire();
    testLandmarksAndNaturalWonders();
    testCapitalsFlagsMaps();
  });
}

void testCapitalsFlagsMaps() {
  for (QuestionCategory category in [
    questionConfig.cat6,
    questionConfig.cat7,
    questionConfig.cat9
  ]) {
    for (QuestionDifficulty difficulty in questionConfig.difficulties) {

      debugPrint("===> FLAGS CAPITALS MAPS FOR DIFF " + difficulty.name + "\n");
      var result = collectorService.getAllQuestionsForCategoryAndDifficulty(
          category, difficulty);
      var qStrings = result.map((e) => e.rawString);
      for (String s in qStrings) {
        debugPrint(s);
      }
      debugPrint("\n\n");
      testCountryRanking(result.length, difficulty, qStrings, {
        questionConfig.diff0: const MapEntry(35, 40),
        questionConfig.diff1: const MapEntry(35, 40),
        questionConfig.diff2: const MapEntry(55, 60),
        questionConfig.diff3: const MapEntry(55, 60),
      });
    }
  }
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
      questionConfig.cat3, questionConfig.diff2);
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

  testCountryRanking(result.length, difficulty, qStrings, {
    questionConfig.diff0: const MapEntry(30, 35),
    questionConfig.diff1: const MapEntry(30, 35),
    questionConfig.diff2: const MapEntry(45, 50),
    questionConfig.diff3: const MapEntry(45, 50),
  });
}

void testCountryRanking(
    int resultLength,
    QuestionDifficulty difficulty,
    Iterable<String> countryNamesFromQuestion,
    Map<QuestionDifficulty, MapEntry<int, int>>
        expectedResultsForRangedCountryList) {
  String c0 = "Germany";
  String c1 = "Romania";
  String c2 = "Georgia";
  String c3 = "Vatican City";
  var expectedResLength = expectedResultsForRangedCountryList
      .get<QuestionDifficulty, MapEntry<int, int>>(difficulty)!;
  expect(
      resultLength > expectedResLength.key &&
          resultLength < expectedResLength.value,
      true);
  if (difficulty == questionConfig.diff0) {
    expect(countryNamesFromQuestion.contains(c0), true);
    expect(countryNamesFromQuestion.contains(c1), false);
    expect(countryNamesFromQuestion.contains(c2), false);
    expect(countryNamesFromQuestion.contains(c3), false);
  } else if (difficulty == questionConfig.diff1) {
    expect(countryNamesFromQuestion.contains(c0), false);
    expect(countryNamesFromQuestion.contains(c1), true);
    expect(countryNamesFromQuestion.contains(c2), false);
    expect(countryNamesFromQuestion.contains(c3), false);
  } else if (difficulty == questionConfig.diff2) {
    expect(countryNamesFromQuestion.contains(c0), false);
    expect(countryNamesFromQuestion.contains(c1), false);
    expect(countryNamesFromQuestion.contains(c2), true);
    expect(countryNamesFromQuestion.contains(c3), false);
  } else if (difficulty == questionConfig.diff3) {
    expect(countryNamesFromQuestion.contains(c0), false);
    expect(countryNamesFromQuestion.contains(c1), false);
    expect(countryNamesFromQuestion.contains(c2), false);
    expect(countryNamesFromQuestion.contains(c3), true);
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
