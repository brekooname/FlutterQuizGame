import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/localization_service.dart';

import '../../../../main.dart';
import '../geoquiz_country_utils.dart';
import 'geoquiz_countries_multiple_options_question_parser.dart';

class GeoQuizCountriesMultipleOptionsQuestionService extends QuestionService {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final GeoQuizGameQuestionConfig _questionConfig = GeoQuizGameQuestionConfig();
  final LocalizationService _localizationService = LocalizationService();
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
    return "";
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return question.category == _questionConfig.cat2 &&
            question.difficulty == _questionConfig.diff1
        ? 1
        : 0;
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    var correctAnswers = getCorrectAnswers(question);
    var countryNameForIndex = _geoQuizCountryUtils
        .getCountryNameForIndex(question.rawString.split(":")[0].parseToInt);
    if (_geoQuizCountryUtils.isStatsCategory(question.category)) {
      return questionParser.getAnswerOptionsForStatisticsQuestion(
          question.category, countryNameForIndex, 4);
    } else {
      return questionParser.getAnswerOptionsForQuestion(countryNameForIndex,
          correctAnswers.toSet(), {}, true, correctAnswers.length + 3);
    }
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
