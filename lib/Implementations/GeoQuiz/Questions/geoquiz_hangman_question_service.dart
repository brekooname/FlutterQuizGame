import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import 'geoquiz_hangman_question_parser.dart';

class GeoQuizHangmanQuestionService extends QuestionService {
  final HangmanService _hangmanService = HangmanService();
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
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
  bool isGameFinishedSuccessful(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.containsAll(_hangmanService
        .getNormalizedWordLetters(question.questionToBeDisplayed));
  }

  @override
  String getRandomUnpressedCorrectAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getCorrectAnswers(question);
    answers.shuffle();
    return answers.first;
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return [];
  }

  @override
  Set<String> getAllAnswerOptionsForQuestion(Question question) {
    return _hangmanService.availableLetters.split(",").toSet();
  }

  @override
  bool compareAnswerStrings(String hangmanWord, String answer) {
    hangmanWord = _hangmanService.normalizeString(hangmanWord);
    answer = _hangmanService.normalizeString(answer);
    return hangmanWord.toLowerCase().contains(answer.toLowerCase());
  }

  String getCountryName(String questionRawString) {
    return questionParser.getCountryName(questionRawString);
  }

  Set<String> getAlreadyFoundCountries(
      QuestionDifficulty diff, QuestionCategory cat, bool withSynonyms) {
    var wonQ = _geoQuizLocalStorage.getWonQuestionsForDiffAndCat(diff, cat);
    var allCountries = questionParser.allCountries;

    var allFoundCountries = wonQ.map((e) {
      return allCountries.elementAt(e.index);
    }).toSet();

    if (withSynonyms) {
      Set<String> result = HashSet();
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
    int countryIndex = questionParser.allCountries.indexOf(country);
    return questionParser.allSynonyms
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
