import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/AllContent/astronomy_question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';

import '../../../main.dart';

class AstronomyGameContextService {
  AstronomyLocalStorage astronomyLocalStorage = AstronomyLocalStorage();
  AstronomyQuestionCollectorService questionCollectorService =
      AstronomyQuestionCollectorService();

  static final AstronomyGameContextService singleton =
      AstronomyGameContextService.internal();

  factory AstronomyGameContextService() {
    return singleton;
  }

  AstronomyGameContextService.internal();

  AstronomyGameContext createGameContext(CampaignLevel campaignLevel) {
    var questions = MyApp.appId.gameConfig.questionCollectorService
        .getAllQuestions(categories: [campaignLevel.categories.first]);
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            MyApp.isExtraContentLocked ? 3 : 5, questions);
    var astronomyGameContext = AstronomyGameContext(
      gameContext,
    );
    return astronomyGameContext;
  }
}
