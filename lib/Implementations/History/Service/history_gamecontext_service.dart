import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';

class HistoryGameContextService {
  late MyAppContext myAppContext;

  static final HistoryGameContextService singleton =
      HistoryGameContextService.internal();

  factory HistoryGameContextService({required MyAppContext myAppContext}) {
    singleton.myAppContext = myAppContext;
    return singleton;
  }

  HistoryGameContextService.internal();

  GameContext createGameContext(CampaignLevel campaignLevel,
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig) {
    var gameContext = GameContextService(
            myAppContext: myAppContext,
            allQuestionsWithConfig: allQuestionsWithConfig)
        .createGameContextWithHintsAndQuestions(
            3,
            myAppContext.appId.gameConfig
                .getQuestionParser()
                .getAllQuestionsForCategoryAndDifficulty(
                  allQuestionsWithConfig,
                  campaignLevel.category,
                  campaignLevel.difficulty,
                ));
    return gameContext;
  }
}
