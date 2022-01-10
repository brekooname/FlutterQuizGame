import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import '../geoquiz_country_utils.dart';
import 'geoquiz_hangman_question_parser.dart';

class GeoQuizHangmanQuestionService extends QuestionService {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final HangmanService _hangmanService = HangmanService();
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();
  late GeoQuizHangmanQuestionParser questionParser;

  static final GeoQuizHangmanQuestionService singleton =
      GeoQuizHangmanQuestionService.internal();

  factory GeoQuizHangmanQuestionService(
      {required GeoQuizHangmanQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  GeoQuizHangmanQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return "";
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return -1;
  }

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return compareAnswerStrings(question.questionToBeDisplayed, answer);
  }

  @override
  bool isGameFinishedSuccessful(
      Question question, Iterable<String> pressedAnswers) {
    return pressedAnswers.toSet().containsAll(_hangmanService
        .getNormalizedWordLetters(question.questionToBeDisplayed));
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return [];
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return _hangmanService.availableLetters.split(",").toSet();
  }

  @override
  bool compareAnswerStrings(String hangmanWord, String answer) {
    hangmanWord = _hangmanService.normalizeString(hangmanWord);
    answer = _hangmanService.normalizeString(answer);
    return hangmanWord.toLowerCase().contains(answer.toLowerCase());
  }

  String getCountryName(String questionRawString) {
    return _geoQuizCountryUtils.getCountryName(questionRawString);
  }

  List<String> getCountryNamesForOptions(String questionRawString) {
    return _geoQuizCountryUtils.getCountryNamesForOptions(questionRawString);
  }

  List<String> getAlreadyFoundCountries(
      QuestionDifficulty diff, QuestionCategory cat, bool withSynonyms) {
    var wonQ = _geoQuizLocalStorage.getWonQuestionsForDiffAndCat(diff, cat);

    var questions = _questionCollectorService
        .getAllQuestionsForCategoriesAndDifficulties([diff], [cat]);

    var allFoundCountries = wonQ.map((q) {
      return _geoQuizCountryUtils.getCountryName(questions
          .firstWhere((element) => element.index == q.index)
          .rawString);
    }).toList();

    if (withSynonyms) {
      List<String> result = [];
      result.addAll(allFoundCountries);
      for (String country in allFoundCountries) {
        result.addAll(_getCountrySynonyms(country));
      }
      return result;
    } else {
      return allFoundCountries;
    }
  }

  Set<String> getCorrectPressedCountries(
      String pressedAnswer, List<String> availableCountries, bool exactMatch) {
    return availableCountries
        .where((country) =>
            _isSynonymPressed(pressedAnswer, country, exactMatch) ||
            _isCountryMatch(pressedAnswer, country, exactMatch))
        .toSet();
  }

  List<String> _getCountrySynonyms(String country) {
    int countryIndex = _geoQuizCountryUtils.getCountryIndexForName(country);
    return _geoQuizCountryUtils.allSynonyms
        .getOrDefault<int, List<String>>(countryIndex, []);
  }

  bool _isSynonymPressed(
      String pressedAnswer, String countryToCheck, bool exactMatch) {
    return _getCountrySynonyms(countryToCheck)
        .any((synonym) => _isCountryMatch(pressedAnswer, synonym, exactMatch));
  }

  bool _isCountryMatch(String pressedAnswer, String val, bool exactMatch) {
    var processedString = _hangmanService
        .normalizeString(_hangmanService.removeCharsToBeIgnored(val))
        .toLowerCase();
    return exactMatch && processedString == pressedAnswer ||
        !exactMatch && processedString.startsWith(pressedAnswer);
  }
}
