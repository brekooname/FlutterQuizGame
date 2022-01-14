import 'package:flutter/foundation.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AnswerOptions/geoquiz_options_question_parser.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AnswerOptions/geoquiz_options_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/test_util.dart';

GeoQuizCountryUtils geoQuizCountryUtils = GeoQuizCountryUtils();
GeoQuizGameQuestionConfig questionConfig = GeoQuizGameQuestionConfig();
GeoQuizQuestionCollectorService questionCollectorService =
    GeoQuizQuestionCollectorService();
GeoQuizOptionsQuestionService questionService = GeoQuizOptionsQuestionService(
    questionParser: GeoQuizOptionsQuestionParser());

void main() {
  testWidgets('question service is tested', (WidgetTester tester) async {
    await TestUtil.initApp(Language.en, "geoquiz", tester);

    //CAT0
    //CAT1
    testStatisticsCategories();
    //CAT2
    testNeighboursCategory();
    //CAT3
    //CAT4
    testGeographicalRegionAndEmpireCategory();
    //CAT5 -------> SKIPPED - is dependent question service
    //CAT6
    //CAT7
    //CAT8 -------> SKIPPED - is dependent question service
    //CAT9
    testQuestionsWithCountryIndexes();

    //The other categories use a different question service
  });
}

void testQuestionsWithCountryIndexes() {
  testCapitals("United States", "Washington", questionConfig.diff0);
  testCapitals("Sweden", "Stockholm", questionConfig.diff1);
  testCapitals("Somalia", "Mogadishu", questionConfig.diff2);
  testCapitals("Laos", "Vientiane", questionConfig.diff3);
  verifyQuestion(
    "Which country has this flag?",
    "",
    ["United States"],
    ["United States", "", "", ""],
    questionConfig.cat7,
    questionConfig.diff0,
  );
  verifyQuestion(
    "Which country has this flag?",
    "",
    ["Azerbaijan"],
    ["Azerbaijan", "", "", ""],
    questionConfig.cat7,
    questionConfig.diff2,
  );
  verifyQuestion(
    "Which country is shown on the map?",
    "",
    ["United States"],
    ["United States", "", "", ""],
    questionConfig.cat9,
    questionConfig.diff0,
  );
  verifyQuestion(
    "Which country is shown on the map?",
    "",
    ["Niger"],
    ["Niger", "", "", ""],
    questionConfig.cat9,
    questionConfig.diff3,
  );
}

void testCapitals(
    String country, String capital, QuestionDifficulty difficulty) {
  verifyQuestion(
    "Which country has this capital?",
    capital,
    [country],
    [country, "", "", ""],
    questionConfig.cat6,
    difficulty,
  );
}

void testGeographicalRegionAndEmpireCategory() {
  for (QuestionDifficulty diff in [
    questionConfig.diff0,
    questionConfig.diff2,
  ]) {
    verifyQuestion(
      "Which country is in this geographical region?",
      "Baltic states",
      ["Estonia", "Lithuania", "Latvia"],
      ["Estonia", "", "", "", "", ""],
      questionConfig.cat3,
      diff,
    );
  }
  verifyQuestion(
    "To which geographical region do these countries belong?",
    "Lithuania, Estonia, Latvia",
    ["Baltic states"],
    ["Baltic states", "", "", ""],
    questionConfig.cat3,
    questionConfig.diff1,
  );
  for (QuestionDifficulty diff in [
    questionConfig.diff1,
    questionConfig.diff3,
  ]) {
    verifyQuestion(
        "Which country or part of this country was part of this empire?",
        "Mughal Empire",
        ["India", "Afghanistan", "Pakistan", "Bangladesh"],
        ["India", "", "", "", "", "", ""],
        questionConfig.cat4,
        diff,
        questionAt: 1);
  }
  verifyQuestion(
      "To which empire did these countries or part of these countries belong?",
      "India, Afghanistan, Pakistan, Bangladesh",
      ["Mughal Empire"],
      ["Mughal Empire", "", "", ""],
      questionConfig.cat4,
      questionConfig.diff2,
      questionAt: 1);
}

void testNeighboursCategory() {
  for (QuestionDifficulty diff in [
    questionConfig.diff0,
    questionConfig.diff2,
    questionConfig.diff3
  ]) {
    verifyQuestion(
        "Which country is a neighbour of Germany?",
        "Germany",
        [
          "Austria",
          "Belgium",
          "Czech Republic",
          "Denmark",
          "France",
          "Luxembourg",
          "Netherlands",
          "Poland",
          "Switzerland"
        ],
        [
          "Austria",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
        ],
        questionConfig.cat2,
        diff,
        questionAt: 7);
  }

  verifyQuestion(
      "Which country has these neighbours?",
      "France, Belgium, Poland, Austria, Switzerland, Netherlands, Denmark, Czech Republic,"
          " Luxembourg",
      ["Germany"],
      ["Germany", "", "", ""],
      questionConfig.cat2,
      questionConfig.diff1,
      questionAt: 7);
}

void testStatisticsCategories() {
  verifyQuestion(
    "Which country is among the top 10 most populous countries in the world?",
    "",
    ["United States"],
    ["United States", "", "", ""],
    questionConfig.cat0,
    questionConfig.diff0,
  );
  verifyQuestion(
    "Which country is among the top 10 largest countries in the world by land area?",
    "",
    ["China"],
    ["China", "", "", ""],
    questionConfig.cat1,
    questionConfig.diff1,
  );
}

void verifyQuestion(
    String expectedPrefix,
    String expectedQuestionToDisplay,
    List<String> expectedCorrectOptions,
    List<String> expectedAnswerOptions,
    QuestionCategory category,
    QuestionDifficulty difficulty,
    {int? questionAt}) {
  Question question = getQuestion(difficulty, category, questionAt: questionAt);
  expect(questionService.getPrefixToBeDisplayedForQuestion(question),
      expectedPrefix,
      reason: "wrong displayed prefix");
  expect(questionService.getQuestionToBeDisplayed(question),
      expectedQuestionToDisplay,
      reason: "wrong displayed question");

  List<String> correctAnswers = questionService.getCorrectAnswers(question);
  verifyListOfCountries(
      expectedCorrectOptions, correctAnswers.toSet(), "CORRECT ANSWERS");
  debugPrint("CORRECT ANSWERS " + correctAnswers.toString());

  Set<String> answerOptions = questionService.getQuizAnswerOptions(question);
  verifyListOfCountries(expectedAnswerOptions, answerOptions, "OPTIONS");
  debugPrint("OPTIONS " + answerOptions.toString());
}

void verifyListOfCountries(List<String> expectedListOfCountries,
    Set<String> actualListOfCountries, String typeOfList) {
  var actualListOfCountriesString =
      actualListOfCountries.map((e) => "\"" + e + "\"").toString();
  if (expectedListOfCountries.where((element) => element.isNotEmpty).length ==
      1) {
    expect(actualListOfCountries.contains(expectedListOfCountries.first), true,
        reason: typeOfList +
            " expected countries are not same with actual" +
            actualListOfCountriesString);
  } else {
    expect(actualListOfCountries.containsAll(expectedListOfCountries), true,
        reason: typeOfList +
            " expected countries are not same with actual " +
            actualListOfCountriesString);
  }
  expect(actualListOfCountries.length, expectedListOfCountries.length,
      reason: typeOfList +
          " expected a different amount of countries " +
          actualListOfCountriesString);
}

Question getQuestion(QuestionDifficulty difficulty, QuestionCategory category,
    {int? questionAt}) {
  List<Question> questions = questionCollectorService
      .getAllQuestionsForCategoriesAndDifficulties([difficulty], [category]);
  expect(questions.length >= 4, true);
  return questions.elementAt(questionAt ?? 2);
}
