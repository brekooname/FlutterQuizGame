
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

class GeoQuizGameContext extends GameContext {

  int gameScore = 0;
  int consecutiveCorrectAnswers = 0;

  GeoQuizGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
