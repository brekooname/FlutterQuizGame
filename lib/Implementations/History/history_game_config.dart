import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';

import 'Constants/history_question_config.dart';

class HistoryGameConfig extends GameConfig {

  static final HistoryGameConfig singleton = HistoryGameConfig.internal();

  factory HistoryGameConfig() {
    return singleton;
  }

  HistoryGameConfig.internal();

  @override
  GameQuestionConfig getGameQuestionConfig() {
    return HistoryGameQuestionConfig();
  }
}
