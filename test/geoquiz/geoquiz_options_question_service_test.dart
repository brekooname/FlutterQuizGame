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
    getQuestion(questionConfig.cat7, questionConfig.diff0),
  );
  verifyQuestion(
    "Which country has this flag?",
    "",
    ["Azerbaijan"],
    ["Azerbaijan", "", "", ""],
    getQuestion(questionConfig.cat7, questionConfig.diff2),
  );
  verifyQuestion(
    "Which country is shown on the map?",
    "",
    ["United States"],
    ["United States", "", "", ""],
    getQuestion(questionConfig.cat9, questionConfig.diff0),
  );
  verifyQuestion(
    "Which country is shown on the map?",
    "",
    ["Niger"],
    ["Niger", "", "", ""],
    getQuestion(questionConfig.cat9, questionConfig.diff3),
  );
}

void testCapitals(
    String country, String capital, QuestionDifficulty difficulty) {
  verifyQuestion(
    "Which country has this capital?",
    capital,
    [country],
    [country, "", "", ""],
    getQuestion(questionConfig.cat6, difficulty),
  );
}

void testGeographicalRegionAndEmpireCategory() {
  for (QuestionDifficulty diff in [
    questionConfig.diff2,
  ]) {
    verifyQuestion(
      "Which countries are located in this geographical region?",
      "Baltic states",
      ["Estonia", "Lithuania", "Latvia"],
      ["Estonia", "", "", "", "", ""],
      getQuestion(questionConfig.cat3, diff),
    );
  }
  verifyQuestion(
    "Which geographical region do these countries belong to?",
    "Lithuania, Estonia, Latvia",
    ["Baltic states"],
    ["Baltic states", "", "", ""],
    getQuestion(questionConfig.cat3, questionConfig.diff1),
  );
  for (QuestionDifficulty diff in [
    questionConfig.diff3,
  ]) {
    var question = getQuestion(questionConfig.cat4, diff, questionAt: 1);
    var expectedCorrectOptions = [
      "India",
      "Afghanistan",
      "Pakistan",
      "Bangladesh"
    ];
    expect(
        questionService.isGameFinishedSuccessfulWithOptionList(
            expectedCorrectOptions, ["India", "Afghanistan", "Bangladesh"]),
        false);
    expect(
        questionService.isGameFinishedFailedWithOptionList(
            expectedCorrectOptions, ["India", "Afghanistan", "Bangladesh"]),
        false);
    expect(
        questionService.isGameFinishedSuccessfulWithOptionList(
            expectedCorrectOptions,
            ["India", "Afghanistan", "Pakistan", "Bangladesh"]),
        true);
    expect(
        questionService.isGameFinishedFailedWithOptionList(
            expectedCorrectOptions,
            ["India", "Afghanistan", "x", "Bangladesh"]),
        true);
    verifyQuestion(
        "Which countries were partly or entirely part of this empire?",
        "Mughal Empire",
        expectedCorrectOptions,
        ["India", "", "", "", "", "", ""],
        question);
  }
  verifyQuestion(
      "Which empire included territories from these countries?",
      "India, Afghanistan, Pakistan, Bangladesh",
      ["Mughal Empire"],
      ["Mughal Empire", "", "", ""],
      getQuestion(questionConfig.cat4, questionConfig.diff2, questionAt: 1));
}

void testNeighboursCategory() {
  for (QuestionDifficulty diff in [
    questionConfig.diff2,
    questionConfig.diff3
  ]) {
    verifyQuestion(
        "Find all the neighbours of this country",
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
        getQuestion(questionConfig.cat2, diff, questionAt: 7));
  }
  verifyQuestion(
      "Find a neighbour of this country",
      "Germany",
      [],
      [
        "Austria",
        "",
        "",
        "",
      ],
      getQuestion(questionConfig.cat2, questionConfig.diff0, questionAt: 7),
      expectedAtLeastOneOfCorrectOptions: [
        "Austria",
        "Belgium",
        "Czech Republic",
        "Denmark",
        "France",
        "Luxembourg",
        "Netherlands",
        "Poland",
        "Switzerland"
      ]);

  verifyQuestion(
      "Which country has these neighbours?",
      "France, Belgium, Poland, Austria, Switzerland, Netherlands, Denmark, Czech Republic,"
          " Luxembourg",
      ["Germany"],
      ["Germany", "", "", ""],
      getQuestion(questionConfig.cat2, questionConfig.diff1, questionAt: 7));
}

void testStatisticsCategories() {
  var question = getQuestion(
    questionConfig.cat0,
    questionConfig.diff0,
  );
  var expectedCorrectOptions = ["United States"];
  expect(
      questionService.isGameFinishedSuccessful(
          question, expectedCorrectOptions),
      true);
  expect(questionService.isGameFinishedSuccessful(question, ["wrong"]), false);
  expect(questionService.isGameFinishedFailed(question, ["wrong"]), true);
  verifyQuestion(
      "Which country is among the top 10 most populous countries in the world?",
      "",
      expectedCorrectOptions,
      ["United States", "", "", ""],
      question);
  verifyQuestion(
      "Which country is among the top 10 largest countries in the world by land area?",
      "",
      ["China"],
      ["China", "", "", ""],
      getQuestion(
        questionConfig.cat1,
        questionConfig.diff1,
      ));
}

void verifyQuestion(
    String expectedPrefix,
    String expectedQuestionToDisplay,
    List<String> expectedCorrectOptions,
    List<String> expectedAnswerOptions,
    Question question,
    {List<String>? expectedAtLeastOneOfCorrectOptions}) {
  questionService.clearCache();
  expect(questionService.getPrefixToBeDisplayedForQuestion(question),
      expectedPrefix,
      reason: "wrong displayed prefix");
  expect(questionService.getQuestionToBeDisplayed(question),
      expectedQuestionToDisplay,
      reason: "wrong displayed question");

  List<String> correctAnswers = questionService.getCorrectAnswers(question);
  verifyListOfCountries(
      expectedCorrectOptions, correctAnswers.toSet(), "CORRECT ANSWERS",
      expectedAtLeastOneOfThisListAsCorrectOption:
          expectedAtLeastOneOfCorrectOptions);
  debugPrint("CORRECT ANSWERS " + correctAnswers.toString());

  Set<String> answerOptions = questionService.getQuizAnswerOptions(question);
  verifyListOfCountries(expectedAnswerOptions, answerOptions, "OPTIONS",
      expectedAtLeastOneOfThisListAsCorrectOption:
          expectedAtLeastOneOfCorrectOptions);
  debugPrint("OPTIONS " + answerOptions.toString());
}

void verifyListOfCountries(List<String> expectedListOfCountries,
    Set<String> actualListOfCountries, String typeOfList,
    {List<String>? expectedAtLeastOneOfThisListAsCorrectOption}) {
  var actualListOfCountriesString =
      actualListOfCountries.map((e) => "\"" + e + "\"").toString();
  var reason = typeOfList +
      " expected countries are not same with actual " +
      actualListOfCountriesString;
  if (expectedAtLeastOneOfThisListAsCorrectOption != null) {
    if (typeOfList == "CORRECT ANSWERS" && actualListOfCountries.length == 1) {
      expect(
          expectedAtLeastOneOfThisListAsCorrectOption
              .contains(actualListOfCountries.first),
          true,
          reason: reason);
    } else if (typeOfList == "OPTIONS") {
      expect(
          expectedAtLeastOneOfThisListAsCorrectOption
              .contains(actualListOfCountries.first),
          true,
          reason: reason);
      expect(actualListOfCountries.length, 4,
          reason: typeOfList +
              " expected a different amount of countries " +
              actualListOfCountriesString);
    }
  } else if (expectedListOfCountries
          .where((element) => element.isNotEmpty)
          .length ==
      1) {
    expect(actualListOfCountries.contains(expectedListOfCountries.first), true,
        reason: reason);
    expect(actualListOfCountries.length, expectedListOfCountries.length,
        reason: typeOfList +
            " expected a different amount of countries " +
            actualListOfCountriesString);
  } else {
    expect(actualListOfCountries.containsAll(expectedListOfCountries), true,
        reason: reason);
    expect(actualListOfCountries.length, expectedListOfCountries.length,
        reason: typeOfList +
            " expected a different amount of countries " +
            actualListOfCountriesString);
  }
}

Question getQuestion(QuestionCategory category, QuestionDifficulty difficulty,
    {int? questionAt}) {
  List<Question> questions = questionCollectorService
      .getAllQuestionsForCategoriesAndDifficulties([difficulty], [category]);
  expect(questions.length >= 4, true);
  return questions.elementAt(questionAt ?? 2);
}
