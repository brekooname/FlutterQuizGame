import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';

import '../../../../main.dart';
import '../geoquiz_country_utils.dart';
import 'geoquiz_options_question_parser.dart';

class GeoQuizOptionsQuestionService extends QuestionService {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final GeoQuizGameQuestionConfig _questionConfig = GeoQuizGameQuestionConfig();
  final LocalizationService _localizationService = LocalizationService();
  late GeoQuizOptionsQuestionParser questionParser;

  static final GeoQuizOptionsQuestionService singleton =
      GeoQuizOptionsQuestionService.internal();

  factory GeoQuizOptionsQuestionService(
      {required GeoQuizOptionsQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  GeoQuizOptionsQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question);
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return questionParser.isCategoryFindAnswerByQuestionName(question) ? 1 : 0;
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    var correctAnswers = getCorrectAnswers(question);
    if (_geoQuizCountryUtils.isStatsCategory(question.category)) {
      return _getStatsCategoryAnswerOptions(question);
    } else if (questionParser.isCategoryFindAnswerByQuestionName(question) &&
        _questionConfig.cat2 != question.category) {
      return questionParser.getDependentAnswerOptionsForQuestion(
          question, correctAnswers.first, 4);
    } else {
      return _getCountriesInRangeAnswerOptions(question, correctAnswers);
    }
  }

  Set<String> _getCountriesInRangeAnswerOptions(
      Question question, List<String> correctAnswers) {
    String currentCountryToSearchRange =
        getCurrentCountryToSearchRange(question);
    return questionParser.getAnswerOptionsInCountryRange(
        currentCountryToSearchRange,
        correctAnswers.toSet(),
        {},
        true,
        correctAnswers.length + 3);
  }

  Set<String> _getStatsCategoryAnswerOptions(Question question) {
    var countryNameForIndex = _geoQuizCountryUtils
        .getCountryNameForIndex(question.rawString.split(":")[0].parseToInt);
    return questionParser.getAnswerOptionsForStatisticsQuestion(
        question.category, countryNameForIndex, 4);
  }

  String getCurrentCountryToSearchRange(Question question) {
    String currentCountryToSearchRange = _geoQuizCountryUtils
            .isGeographicalRegionOrEmpireCategory(question.category)
        ? questionParser
            .getCountryNamesFromQuestionOptions(question)
            .elementAt(0)
        : _geoQuizCountryUtils.getCountryNameForIndex(
            question.rawString.split(":")[0].parseToInt);
    return currentCountryToSearchRange;
  }

  @override
  String getPrefixToBeDisplayedForQuestion(Question question) {
    var prefix = MyApp.appId.gameConfig.gameQuestionConfig
        .getPrefixToBeDisplayedForQuestion(
            question.category, getPrefixCodeForQuestion(question));

    if (question.category == _questionConfig.cat2 &&
            getPrefixCodeForQuestion(question) == 0 ||
        question.category == _questionConfig.cat6) {
      prefix = _localizationService.formatTextWithParams(
          prefix, [questionParser.getQuestionToBeDisplayed(question)]);
    }

    return prefix;
  }
}
