import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';

import '../../../main.dart';


class HistoryGameContextService {

  static final HistoryGameContextService singleton =
      HistoryGameContextService.internal();

  factory HistoryGameContextService() {
    return singleton;
  }

  HistoryGameContextService.internal();

  GameContext createGameContext(CampaignLevel campaignLevel,
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig) {
    var gameContext = GameContextService(
            allQuestionsWithConfig: allQuestionsWithConfig)
        .createGameContextWithHintsAndQuestions(
            11,
            MyApp.appId.gameConfig
                .getQuestionParser()
                .getAllQuestionsForCategoriesAndDifficulties(
                  allQuestionsWithConfig,
                  campaignLevel.category,
                  [campaignLevel.difficulty],
                ));
    return gameContext;
  }
}
