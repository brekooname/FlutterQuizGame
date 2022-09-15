import 'package:flutter_app_quiz_game/Game/GameType/game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/anatomy_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/astronomy_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/dopewars_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/geoquiz_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/hangman_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/history_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/iq_game_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/perstest_game_config.dart';

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
    } else if (appKey == "perstest") {
      return PersTestGameConfig();
    } else if (appKey == "dopewars") {
      return DopeWarsGameConfig();
    } else if (appKey == "anatomy") {
      return AnatomyGameConfig();
    } else if (appKey == "iqgame") {
      return IqGameConfig();
    } else if (appKey == "astronomy") {
      return AstronomyGameConfig();
    } else if (appKey == "hangman") {
      return HangmanGameConfig();
    }
    throw UnsupportedError("Unsupported app key ======> " + appKey);
  }
}

class AppId {
  String appKey;
  GameConfig gameConfig;

  AppId(this.appKey, this.gameConfig);
}
