import 'package:flutter_app_quiz_game/Game/GameType/game_type.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';

class AppIds {
  late AppId appId;

  AppIds({required String appKey}) {
    if (appKey == "history") {
      appId = AppId("history", HistoryGameConfig());
    }
  }
}

class AppId {
  String appKey;
  GameConfig gameConfig;

  AppId(this.appKey, this.gameConfig);
}
