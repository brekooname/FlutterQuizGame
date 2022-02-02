import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import 'geoquiz_all_questions.dart';

class GeoQuizQuestionCollectorService extends QuestionCollectorService<
    GeoQuizAllQuestions, GeoQuizGameQuestionConfig> {
  static const int numberOfQuestionsForStatisticsCategory = 10;
  final Map<QuestionDifficulty, PercentRangeForList>
      _percentOfListForDifficulty = {};
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();

  static final GeoQuizQuestionCollectorService singleton =
      GeoQuizQuestionCollectorService.internal();

  factory GeoQuizQuestionCollectorService() {
    singleton._percentOfListForDifficulty.putIfAbsent(
        singleton.gameQuestionConfig.diff0, () => PercentRangeForList(0, 10));
    singleton._percentOfListForDifficulty.putIfAbsent(
        singleton.gameQuestionConfig.diff1, () => PercentRangeForList(10, 25));
    singleton._percentOfListForDifficulty.putIfAbsent(
        singleton.gameQuestionConfig.diff2, () => PercentRangeForList(25, 50));
    singleton._percentOfListForDifficulty.putIfAbsent(
        singleton.gameQuestionConfig.diff3, () => PercentRangeForList(50, 100));
    return singleton;
  }

  GeoQuizQuestionCollectorService.internal();

  List<Question> getAllQuestionsForCategoryAndDifficulty(
      QuestionCategory category, QuestionDifficulty difficulty) {
    List<Question> result = [];
    //------------- CAT 0 ------------- POPULATION ===> top 10
    if (category == gameQuestionConfig.cat0 &&
        difficulty == gameQuestionConfig.diff0) {
      result = getStatsQuestions(category)
          .sublist(0, numberOfQuestionsForStatisticsCategory);
    } else
    //------------- CAT 1 ------------- AREA ===> top 10
    if (category == gameQuestionConfig.cat1 &&
        difficulty == gameQuestionConfig.diff1) {
      result = getStatsQuestions(category)
          .sublist(0, numberOfQuestionsForStatisticsCategory);
    } else
    //------------- CAT 2 ------------- NEIGHBOURS ===> sorted by rank
    if (category == gameQuestionConfig.cat2) {
      var sortedAfterRank = sortQuestionListAfterRankedCountries(
          getEnglishLangQuestions(category), 0);
      //because we have multiple playing types depending on the difficulty level
      //here we show only easy countries diff0
      result = sortedAfterRank.sublist(0, 10);
    } else
    //------------- CAT 3 ------------- GEOGRAPHICAL REGION
    if (category == gameQuestionConfig.cat3 &&
            (difficulty == gameQuestionConfig.diff0 ||
                difficulty == gameQuestionConfig.diff1 ||
                difficulty == gameQuestionConfig.diff2)
        //
        ||
        //------------- CAT 4 ------------- EMPIRE
        category == gameQuestionConfig.cat4 &&
            (difficulty == gameQuestionConfig.diff1 ||
                difficulty == gameQuestionConfig.diff2 ||
                difficulty == gameQuestionConfig.diff3)) {
      result = allQuestions.get<CategoryDifficulty, List<Question>>(
          CategoryDifficulty(category, gameQuestionConfig.diff0))!;
    } else
    //------------- CAT 5 ------------- LANDMARKS
    if (category == gameQuestionConfig.cat5
        //
        ||
        //------------- CAT 8------------- NATURAL WONDERS
        category == gameQuestionConfig.cat8) {
      result = allQuestions.get<CategoryDifficulty, List<Question>>(
          CategoryDifficulty(category, difficulty))!;
    }
    var capitalsCategory = gameQuestionConfig.cat6;
    var flagsCategory = gameQuestionConfig.cat7;
    var mapsCategory = gameQuestionConfig.cat9;
    //------------- CAT 6 ------------- CAPITALS
    if (category == capitalsCategory
        //
        ||
        //------------- CAT 7------------- FLAGS
        category == flagsCategory
        //
        ||
        //------------- CAT 9------------- MAPS
        category == mapsCategory) {
      Map<QuestionCategory, List<String>> countryIndexesForCategory = {
        capitalsCategory: allQuestionsService.allCapitalIndexes,
        flagsCategory: allQuestionsService.allFlags,
        mapsCategory: allQuestionsService.allMaps,
      };
      result = createQuestionsForCountryIndexes(
          countryIndexesForCategory
              .get<QuestionCategory, List<String>>(category)!,
          category,
          difficulty);
    }
    return result
        .map((e) => Question(e.index, difficulty, category, e.rawString))
        .toList();
  }

  List<Question> createQuestionsForCountryIndexes(List<String> countryIndexes,
      QuestionCategory category, QuestionDifficulty difficulty) {
    List<Question> result = [];
    var questionsWithCountry = transformCountriesStringToQuestion(
        countryIndexes, category, difficulty);
    var sortedAfterRank =
        sortQuestionListAfterRankedCountries(questionsWithCountry, 0);
    result = _percentOfListForDifficulty
        .get<QuestionDifficulty, PercentRangeForList>(difficulty)!
        .getQuestionsForRange(sortedAfterRank);
    return result;
  }

  List<Question> transformCountriesStringToQuestion(List<String> countryIndexes,
      QuestionCategory category, QuestionDifficulty difficulty) {
    return allQuestionsService.createQuestions(
        difficulty, category, countryIndexes);
  }

  List<Question> getStatsQuestions(QuestionCategory category) {
    if (!_geoQuizCountryUtils.isStatsCategory(category)) {
      return [];
    }
    return getEnglishLangQuestions(category);
  }

  List<Question> getEnglishLangQuestions(QuestionCategory category) {
    return allQuestionsService
        .getAllQuestionsWithLanguages()
        .get<Language, Map<CategoryDifficulty, List<Question>>>(Language.en)!
        .get(CategoryDifficulty(category, gameQuestionConfig.diff0))!;
  }

  @override
  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> result = [];
    for (QuestionDifficulty diff
        in difficulties ?? gameQuestionConfig.difficulties) {
      for (QuestionCategory questionCategory
          in categories ?? gameQuestionConfig.categories) {
        result.addAll(
            getAllQuestionsForCategoryAndDifficulty(questionCategory, diff));
      }
    }
    return result;
  }

  List<int> sortCountryIndexListAfterRankedCountries(List<int> countryIndexes) {
    List<int> allCountriesIndexesRanked = getAllCountriesSortedAfterRank();
    countryIndexes.sort((a, b) => allCountriesIndexesRanked
        .indexOf(a)
        .compareTo(allCountriesIndexesRanked.indexOf(b)));
    return countryIndexes;
  }

  List<Question> sortQuestionListAfterRankedCountries(
      List<Question> questions, int? countryPositionInRawString) {
    List<int> allCountriesIndexesRanked = getAllCountriesSortedAfterRank();
    questions.sort((a, b) => allCountriesIndexesRanked
        .indexOf(getIndexOfCountry(a, countryPositionInRawString))
        .compareTo(allCountriesIndexesRanked
            .indexOf(getIndexOfCountry(b, countryPositionInRawString))));
    return questions;
  }

  int getIndexOfCountry(Question q, int? countryPositionInRawString) =>
      countryPositionInRawString == null
          ? _geoQuizCountryUtils.getCountryIndexForName(q.rawString)
          : q.rawString.split(":")[countryPositionInRawString].parseToInt;

  List<int> getAllCountriesSortedAfterRank() {
    List<String> allCountriesRanked = allQuestionsService.allCountriesRanked;
    allCountriesRanked.sort((a, b) =>
        a.split(":")[1].parseToInt.compareTo(b.split(":")[1].parseToInt));
    return allCountriesRanked.map((e) => e.split(":")[0].parseToInt).toList();
  }
}

class PercentRangeForList {
  int startPercent;
  int endPercent;

  PercentRangeForList(this.startPercent, this.endPercent);

  List<Question> getQuestionsForRange(List<Question> questions) {
    var indexRange = _getIndexRange(questions.length);
    return questions.sublist(indexRange.start, indexRange.end);
  }

  IndexRange _getIndexRange(int listLength) {
    double start = startPercent / 100 * listLength;
    double end = endPercent / 100 * listLength;

    return IndexRange(
        start.ceil(), end.ceil() > listLength ? listLength : end.ceil());
  }
}

class IndexRange {
  int start;
  int end;

  IndexRange(this.start, this.end);
}
