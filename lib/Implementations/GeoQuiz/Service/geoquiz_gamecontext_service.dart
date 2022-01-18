import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AllContent/geoquiz_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../main.dart';

class GeoQuizGameContextService {

  static const int numberOfQuestionsPerGame = 10;
  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();

  static final GeoQuizGameContextService singleton =
      GeoQuizGameContextService.internal();

  factory GeoQuizGameContextService() {
    return singleton;
  }

  GeoQuizGameContextService.internal();

  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    List<Question> questions = MyApp.appId.gameConfig.questionCollectorService
        .getAllQuestionsForCategoriesAndDifficulties(
      [campaignLevel.difficulty],
      campaignLevel.category,
    );

    questions.shuffle();
    questions = questions.sublist(0, numberOfQuestionsPerGame);

    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(5, questions);

    return GeoQuizGameContext(gameContext);
  }

  void _removeStatsQuestionsIfAlreadyPlayed(
      GameContext gameContext, CampaignLevel campaignLevel) {
    List<QuestionKey> finishedQuestions =
        _geoQuizLocalStorage.getWonQuestionsForDiff(campaignLevel.difficulty);

    for (QuestionCategory statsCat in _geoQuizCountryUtils.statsCategories) {
      int finishedQuestionsForCat =
          finishedQuestions.where((element) => element.cat == statsCat).length;
      if (finishedQuestionsForCat >=
          GeoQuizQuestionCollectorService
              .numberOfQuestionsForStatisticsCategory) {
        gameContext.gameUser.removeQuestionInfos(gameContext.gameUser
            .getOpenQuestions()
            .where((element) => element.question.category == statsCat)
            .toList());
      }
    }
  }
}
