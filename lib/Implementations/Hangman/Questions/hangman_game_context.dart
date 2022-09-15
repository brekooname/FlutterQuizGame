
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

class HangmanGameContext extends GameContext {

  HangmanGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
