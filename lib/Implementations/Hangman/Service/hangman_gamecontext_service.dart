import 'dart:math';

import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_local_storage.dart';

import '../../../main.dart';

class HangmanGameContextService {
  static const int numberOfQuestionsPerGame = 5;
  HangmanLocalStorage hangmanLocalStorage = HangmanLocalStorage();

  static final HangmanGameContextService singleton =
      HangmanGameContextService.internal();

  factory HangmanGameContextService() {
    return singleton;
  }

  HangmanGameContextService.internal();

  HangmanGameContext createGameContext(CampaignLevel campaignLevel) {
    var questions = MyApp.appId.gameConfig.questionCollectorService
        .getAllQuestions(
            categories: [campaignLevel.categories.first],
            difficulties: [campaignLevel.difficulty]);
    questions.shuffle();
    questions =
        questions.sublist(0, min(questions.length, numberOfQuestionsPerGame));
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(3, questions);
    var hangmanGameContext = HangmanGameContext(gameContext);
    return hangmanGameContext;
  }
}
