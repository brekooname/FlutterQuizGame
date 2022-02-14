
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

class DopeWarsContext extends GameContext {

  DopeWarsContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
