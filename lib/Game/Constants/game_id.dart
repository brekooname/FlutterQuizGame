import 'package:flutter_app_quiz_game/Game/GameType/game_type.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';

class GameIds {
  static GameId history = GameId("history", HistoryGameConfig());
}

class GameId {
  String name;
  GameConfig gameConfig;

  GameId(this.name, this.gameConfig);
}
