import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Questions/skel_game_context.dart';

class SkelGameContextService {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();

  static final SkelGameContextService singleton =
      SkelGameContextService.internal();

  factory SkelGameContextService() {
    return singleton;
  }

  SkelGameContextService.internal();

  SkelGameContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext =
        GameContextService().createGameContextWithHintsAndQuestions(1, []);
    var persTestGameContext = SkelGameContext(gameContext);
    return persTestGameContext;
  }
}
