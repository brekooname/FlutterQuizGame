import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';

import '../../../main.dart';

class DopeWarsContextService {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();

  static final DopeWarsContextService singleton =
      DopeWarsContextService.internal();

  factory DopeWarsContextService() {
    return singleton;
  }

  DopeWarsContextService.internal();

  DopeWarsContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            0,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [campaignLevel.categories.first]));
    var dopeWarsGameContext = DopeWarsContext(gameContext);
    return dopeWarsGameContext;
  }
}
