import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';

class PersTestGameContext extends GameContext {
  QuestionInfo currentQuestionInfo;

  PersTestGameContext(this.currentQuestionInfo, GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
