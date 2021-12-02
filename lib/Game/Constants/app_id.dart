import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class AppIds {
  static AppId history = AppId("history", HistoryGameConfig());

  late AppId appId;

  Map<String, GameConfig> appIds = HashMap<String, GameConfig>();

  AppIds({required String appKey}) {
    //
    appIds.putIfAbsent(history.appKey, () => history.gameConfig);
    //

    appId = AppId(appKey, appIds.get(appKey));
  }
}

class AppId {
  String appKey;
  GameConfig gameConfig;

  AppId(this.appKey, this.gameConfig);
}
