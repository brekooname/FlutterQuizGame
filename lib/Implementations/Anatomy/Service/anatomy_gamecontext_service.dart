import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';

import '../../../main.dart';

class AnatomyGameContextService {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();

  static final AnatomyGameContextService singleton =
      AnatomyGameContextService.internal();

  factory AnatomyGameContextService() {
    return singleton;
  }

  AnatomyGameContextService.internal();

  AnatomyGameContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            MyApp.isExtraContentLocked ? 8 : 3,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [campaignLevel.categories.first]));
    var anatomyGameContext = AnatomyGameContext(gameContext);
    return anatomyGameContext;
  }
}
