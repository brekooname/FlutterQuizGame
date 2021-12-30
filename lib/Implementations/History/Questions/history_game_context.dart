
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

class HistoryGameContext extends GameContext {
  int totalNrOfQuestionsForCampaignLevel;

  HistoryGameContext(GameContext gameContext, this.totalNrOfQuestionsForCampaignLevel)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
