import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class GeoQuizGameContextService {
  Map<QuestionCategory, int> categoriesWithStatsCriteria = HashMap();
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();

  static final GeoQuizGameContextService singleton =
      GeoQuizGameContextService.internal();

  factory GeoQuizGameContextService() {
    var questionConfig = GeoQuizGameQuestionConfig();
    //Population > 1.000.000.00
    singleton.categoriesWithStatsCriteria
        .putIfAbsent(questionConfig.cat0, () => 100000000);
    return singleton;
  }

  GeoQuizGameContextService.internal();

  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    var questions =
        _questionCollectorService.getAllQuestionsForCategoriesAndDifficulties(
      [campaignLevel.difficulty],
      campaignLevel.category,
    );

    _filterStatsQuestionsAfterCriteria(questions);

    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(1, questions);

    removeStatsQuestionsIfAlreadyPlayed(gameContext, campaignLevel);

    return GeoQuizGameContext(gameContext);
  }

  void _filterStatsQuestionsAfterCriteria(List<Question> questions) {
    categoriesWithStatsCriteria.forEach((cat, criteria) {
      questions.removeWhere((q) =>
          q.category == cat && q.rawString.split(":")[1].parseToInt < criteria);
    });
  }

  void removeStatsQuestionsIfAlreadyPlayed(
      GameContext gameContext, CampaignLevel campaignLevel) {
    List<QuestionKey> finishedQuestions =
        _geoQuizLocalStorage.getWonQuestionsForDiff(campaignLevel.difficulty);
    int nrOfStatsQuestionsToIncludePerCat = 5;

    for (QuestionCategory statsCat in categoriesWithStatsCriteria.keys) {
      int finishedQuestionsForCat =
          finishedQuestions.where((element) => element.cat == statsCat).length;
      if (finishedQuestionsForCat >= nrOfStatsQuestionsToIncludePerCat) {
        gameContext.gameUser.removeQuestionInfos(gameContext.gameUser
            .getOpenQuestions()
            .where((element) => element.question.category == statsCat)
            .toList());
      }
    }
  }
}
