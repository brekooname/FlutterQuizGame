import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_type.dart';

import 'Constants/history_question_config.dart';

class HistoryGameType extends GameType {
  @override
  GameQuestionConfig getGameQuestionConfig() {
    return HistoryGameQuestionConfig();
  }
}
