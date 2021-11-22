import 'package:flutter_app_quiz_game/Game/Question/question_config.dart';

import 'game_user.dart';

class GameContext {
  GameUser currentUserGameUser;
  late int amountAvailableHints;

  QuestionConfig questionConfig;

  GameContext(this.currentUserGameUser, this.questionConfig) {
    this.amountAvailableHints = questionConfig.hints;
  }
}
