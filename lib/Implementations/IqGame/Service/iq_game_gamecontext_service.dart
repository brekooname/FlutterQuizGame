import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';

import '../../../main.dart';

class IqGameContextService {
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();

  static final IqGameContextService singleton =
      IqGameContextService.internal();

  factory IqGameContextService() {
    return singleton;
  }

  IqGameContextService.internal();

  IqGameContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            0,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [campaignLevel.categories.first]));
    var iqGameContext = IqGameContext(gameContext);
    return iqGameContext;
  }
}
