
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

class SkelGameContext extends GameContext {

  SkelGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
