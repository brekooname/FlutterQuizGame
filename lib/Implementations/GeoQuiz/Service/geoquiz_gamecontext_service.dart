import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class GeoQuizGameContextService {
  static const int numberOfQuestionsForStatisticsCategory = 5;

  final GeoQuizLocalStorage _geoQuizLocalStorage = GeoQuizLocalStorage();
  final GeoQuizGameQuestionConfig _gameQuestionConfig = GeoQuizGameQuestionConfig();
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();

  static final GeoQuizGameContextService singleton =
      GeoQuizGameContextService.internal();

  factory GeoQuizGameContextService() {
    return singleton;
  }

  GeoQuizGameContextService.internal();

  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    var questions =
        _questionCollectorService.getAllQuestionsForCategoriesAndDifficulties(
      [campaignLevel.difficulty],
      campaignLevel.category,
    );

    _geoQuizCountryUtils.filterStatsQuestionsAfterCriteria(questions);

    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(1, questions);

    removeStatsQuestionsIfAlreadyPlayed(gameContext, campaignLevel);

    return GeoQuizGameContext(gameContext);
  }

  void removeStatsQuestionsIfAlreadyPlayed(
      GameContext gameContext, CampaignLevel campaignLevel) {
    List<QuestionKey> finishedQuestions =
        _geoQuizLocalStorage.getWonQuestionsForDiff(campaignLevel.difficulty);

    for (QuestionCategory statsCat
        in _gameQuestionConfig.categoriesWithStatsCriteria.keys) {
      int finishedQuestionsForCat =
          finishedQuestions.where((element) => element.cat == statsCat).length;
      if (finishedQuestionsForCat >= numberOfQuestionsForStatisticsCategory) {
        gameContext.gameUser.removeQuestionInfos(gameContext.gameUser
            .getOpenQuestions()
            .where((element) => element.question.category == statsCat)
            .toList());
      }
    }
  }
}
