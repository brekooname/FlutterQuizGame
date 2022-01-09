import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../geoquiz_country_utils.dart';
import 'geoquiz_countries_multiple_options_question_parser.dart';

class GeoQuizCountriesMultipleOptionsQuestionService extends QuestionService {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  late GeoQuizCountriesMultipleOptionsQuestionParser questionParser;

  static final GeoQuizCountriesMultipleOptionsQuestionService singleton =
      GeoQuizCountriesMultipleOptionsQuestionService.internal();

  factory GeoQuizCountriesMultipleOptionsQuestionService(
      {required GeoQuizCountriesMultipleOptionsQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  GeoQuizCountriesMultipleOptionsQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question.rawString);
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return -1;
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
    return questionParser.getCorrectAnswersFromRawString(question.rawString);
  }

  @override
  Set<String> getAllAnswerOptionsForQuestion(Question question) {
    var correctAnswers = getCorrectAnswers(question);
    return questionParser.getAllPossibleAnswersForQuestion(
        _geoQuizCountryUtils.getCountryNameForIndex(
            question.rawString.split(":")[0].parseToInt),
        correctAnswers.toSet(),
        {},
        true,
        correctAnswers.length + 3);
  }
}
