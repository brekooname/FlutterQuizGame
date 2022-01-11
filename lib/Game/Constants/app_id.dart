import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/geoquiz_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';

class AppIds {
  static final AppIds singleton = AppIds.internal();

  factory AppIds() {
    return singleton;
  }

  AppIds.internal();

  AppId getAppId(String appKey) {
    return AppId(appKey, _createGameConfig(appKey));
  }

  GameConfig _createGameConfig(String appKey) {
    if (appKey == "history") {
      return HistoryGameConfig();
    } else if (appKey == "geoquiz") {
      return GeoQuizGameConfig();
    }
    throw UnsupportedError("Unsupported app key ======> " + appKey);
  }
}

class AppId {
  String appKey;
  GameConfig gameConfig;

  AppId(this.appKey, this.gameConfig);
}
