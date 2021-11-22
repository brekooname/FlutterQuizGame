import 'package:flutter_app_quiz_game/Game/GameType/game_type.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_type.dart';

class GameIds {
  static GameId history = GameId("history", HistoryGameType());
}

class GameId {
  String name;
  GameType gameType;

  GameId(this.name, this.gameType);
}
