import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';

import '../../../main.dart';

class AstronomyGameContextService {
  AstronomyLocalStorage astronomyLocalStorage = AstronomyLocalStorage();

  static final AstronomyGameContextService singleton =
      AstronomyGameContextService.internal();

  factory AstronomyGameContextService() {
    return singleton;
  }

  AstronomyGameContextService.internal();

  AstronomyGameContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            3,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [campaignLevel.categories.first]));
    var astronomyGameContext = AstronomyGameContext(gameContext);
    return astronomyGameContext;
  }
}
