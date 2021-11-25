import 'package:flutter_app_quiz_game/Game/GameType/game_type.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';

class AppIds {
  late AppId history;

  AppIds() {
    history = AppId("history", HistoryGameConfig());
  }
}

class AppId {
  String name;
  GameConfig gameConfig;

  AppId(this.name, this.gameConfig);
}
