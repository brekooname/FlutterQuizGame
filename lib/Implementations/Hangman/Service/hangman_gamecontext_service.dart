import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';

import '../../../main.dart';

class HangmanGameContextService {
  HangmanLocalStorage hangmanLocalStorage = HangmanLocalStorage();

  static final HangmanGameContextService singleton =
      HangmanGameContextService.internal();

  factory HangmanGameContextService() {
    return singleton;
  }

  HangmanGameContextService.internal();

  HangmanGameContext createGameContext(CampaignLevel campaignLevel) {
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            0,
            MyApp.appId.gameConfig.questionCollectorService
                .getAllQuestions(categories: [campaignLevel.categories.first]));
    var hangmanGameContext = HangmanGameContext(gameContext);
    return hangmanGameContext;
  }
}
