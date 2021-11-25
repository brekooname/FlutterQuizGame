import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Game/game_level.dart';
import 'package:flutter_app_quiz_game/Game/my_app_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryLocalStorage {
  late SharedPreferences prefs;

  static final HistoryLocalStorage singleton = HistoryLocalStorage.internal();

  factory HistoryLocalStorage({required MyAppContext myAppContext}) {
    singleton.prefs = myAppContext.localStorage;
    return singleton;
  }

  HistoryLocalStorage.internal();

  Set<int> getLevelsWon(GameLevel gameLevel) {
    return convertToInt(getLevelsWonFieldName(gameLevel));
  }

  Set<int> getLevelsLost(GameLevel gameLevel) {
    return convertToInt(getLevelsLostFieldName(gameLevel));
  }

  void setLevelLost(int level, GameLevel gameLevel) {
    Set<int> l = getLevelsLost(gameLevel);
    l.add(level);
    prefs.setString(getLevelsLostFieldName(gameLevel), l.join(","));
  }

  Set<int> getLevelsImgShown(GameLevel gameLevel) {
    return convertToInt(getLevelsImageShownFieldName(gameLevel));
  }

  void setLeveImgShown(int level, GameLevel gameLevel) {
    Set<int> l = getLevelsImgShown(gameLevel);
    l.add(level);
    prefs.setString(getLevelsImageShownFieldName(gameLevel), l.join(","));
  }

  Set<int> getAllLevelsPlayed(GameLevel gameLevel) {
    Set<int> all = HashSet<int>();
    all.addAll(getLevelsLost(gameLevel));
    all.addAll(getLevelsWon(gameLevel));
    return all;
  }

  Set<int> convertToInt(String fieldName) {
    List<String> list = (prefs.getString(fieldName) ?? "").split(",");
    Set<int> res = HashSet<int>();
    for (String i in list) {
      if (i.isNotEmpty) {
        res.add(int.parse(i));
      }
    }
    return res;
  }

  void setLevelWon(int level, GameLevel gameLevel) {
    Set<int> l = getLevelsWon(gameLevel);
    l.add(level);
    prefs.setString(getLevelsWonFieldName(gameLevel), l.join(","));
    int levelsWonSize = getLevelsWon(gameLevel).length;
    if (levelsWonSize > getHighScore(gameLevel)) {
      setIsHighScore(gameLevel, true);
      setHighScore(levelsWonSize, gameLevel);
    }
  }

  bool isHighScore(GameLevel gameLevel) {
    return prefs.getBool(getIsHighScoreFieldName(gameLevel)) ?? false;
  }

  void setIsHighScore(GameLevel gameLevel, bool val) {
    prefs.setBool(getIsHighScoreFieldName(gameLevel), val);
  }

  void setHighScore(int score, GameLevel gameLevel) {
    prefs.setInt(getHighScoreFieldName(gameLevel), score);
  }

  int getHighScore(GameLevel gameLevel) {
    return prefs.getInt(getHighScoreFieldName(gameLevel)) ?? 0;
  }

  String getLevelsImageShownFieldName(GameLevel gameLevel) {
    return gameLevel.name + "imgShown";
  }

  String getLevelsWonFieldName(GameLevel gameLevel) {
    return gameLevel.name + "levelsWon";
  }

  String getLevelsLostFieldName(GameLevel gameLevel) {
    return gameLevel.name + "levelsLost";
  }

  String getHighScoreFieldName(GameLevel gameLevel) {
    return gameLevel.name + "highScore";
  }

  String getIsHighScoreFieldName(GameLevel gameLevel) {
    return gameLevel.name + "isHighScore";
  }

  void clearLevelsPlayed(GameLevel gameLevel) {
    setIsHighScore(gameLevel, false);
    prefs.setString(getLevelsWonFieldName(gameLevel), "");
    prefs.setString(getLevelsLostFieldName(gameLevel), "");
    prefs.setString(getLevelsImageShownFieldName(gameLevel), "");
  }
}
