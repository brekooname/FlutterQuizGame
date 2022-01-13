
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

class GeoQuizGameContext extends GameContext {

  bool statsQuestionShouldUseHangmanScreen = false;

  GeoQuizGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
