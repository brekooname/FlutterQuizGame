import 'package:flutter_app_quiz_game/Game/Question/question_config.dart';

import 'game_user.dart';

class GameContext {
  GameUser gameUser;
  late int amountAvailableHints;

  QuestionConfig questionConfig;

  GameContext(this.gameUser, this.questionConfig) {
    this.amountAvailableHints = questionConfig.hints;
  }
}
