import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';

import '../../../main.dart';

class PersTestGameContextService {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();

  static final PersTestGameContextService singleton =
      PersTestGameContextService.internal();

  factory PersTestGameContextService() {
    return singleton;
  }

  PersTestGameContextService.internal();

  PersTestGameContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            0,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [campaignLevel.categories.first]));
    var persTestGameContext = PersTestGameContext(
        gameContext.gameUser.getOpenQuestions().first, gameContext);
    return persTestGameContext;
  }
}
