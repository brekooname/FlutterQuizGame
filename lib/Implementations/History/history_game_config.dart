import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants/history_question_config.dart';

class HistoryGameConfig extends GameConfig {

  @override
  GameQuestionConfig getGameQuestionConfig() {
    return HistoryGameQuestionConfig();
  }
}
