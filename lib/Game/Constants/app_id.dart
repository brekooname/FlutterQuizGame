import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/geoquiz_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class AppIds {
  Map<String, GameConfig> appIds = HashMap<String, GameConfig>();

  static final AppIds singleton = AppIds.internal();

  factory AppIds() {
    //
    singleton.appIds.putIfAbsent("history", () => HistoryGameConfig());
    singleton.appIds.putIfAbsent("geoquiz", () => GeoQuizGameConfig());
    //
    return singleton;
  }

  AppIds.internal();

  AppId getAppId(String appKey) {
    var gameConfig = appIds.get<String, GameConfig>(appKey);
    if (gameConfig == null) {
      throw UnsupportedError("Unsupported app key ======> " + appKey);
    }
    return AppId(appKey, gameConfig);
  }
}

class AppId {
  String appKey;
  GameConfig gameConfig;

  AppId(this.appKey, this.gameConfig);
}
