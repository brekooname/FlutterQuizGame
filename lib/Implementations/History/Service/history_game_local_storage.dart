import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
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

  Set<int> getLevelsWon(CampaignLevel gameLevel) {
    return convertToInt(_getLevelsWonFieldName(gameLevel));
  }

  Set<int> getLevelsLost(CampaignLevel gameLevel) {
    return convertToInt(_getLevelsLostFieldName(gameLevel));
  }

  void setLevelLost(int level, CampaignLevel gameLevel) {
    Set<int> l = getLevelsLost(gameLevel);
    l.add(level);
    prefs.setString(_getLevelsLostFieldName(gameLevel), l.join(","));
  }

  Set<int> getLevelsImgShown(CampaignLevel gameLevel) {
    return convertToInt(_getLevelsImageShownFieldName(gameLevel));
  }

  void setLeveImgShown(int level, CampaignLevel gameLevel) {
    Set<int> l = getLevelsImgShown(gameLevel);
    l.add(level);
    prefs.setString(_getLevelsImageShownFieldName(gameLevel), l.join(","));
  }

  Set<int> getAllLevelsPlayed(CampaignLevel gameLevel) {
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

  void setLevelWon(int level, CampaignLevel gameLevel) {
    Set<int> l = getLevelsWon(gameLevel);
    l.add(level);
    prefs.setString(_getLevelsWonFieldName(gameLevel), l.join(","));
    int levelsWonSize = getLevelsWon(gameLevel).length;
    if (levelsWonSize > getHighScore(gameLevel)) {
      setIsHighScore(gameLevel, true);
      setHighScore(levelsWonSize, gameLevel);
    }
  }

  bool isHighScore(CampaignLevel gameLevel) {
    return prefs.getBool(_getIsHighScoreFieldName(gameLevel)) ?? false;
  }

  void setIsHighScore(CampaignLevel gameLevel, bool val) {
    prefs.setBool(_getIsHighScoreFieldName(gameLevel), val);
  }

  void setHighScore(int score, CampaignLevel gameLevel) {
    prefs.setInt(_getHighScoreFieldName(gameLevel), score);
  }

  int getHighScore(CampaignLevel gameLevel) {
    return prefs.getInt(_getHighScoreFieldName(gameLevel)) ?? 0;
  }

  String _getLevelsImageShownFieldName(CampaignLevel gameLevel) {
    return gameLevel.name + "imgShown";
  }

  String _getLevelsWonFieldName(CampaignLevel gameLevel) {
    return gameLevel.name + "levelsWon";
  }

  String _getLevelsLostFieldName(CampaignLevel gameLevel) {
    return gameLevel.name + "levelsLost";
  }

  String _getHighScoreFieldName(CampaignLevel gameLevel) {
    return gameLevel.name + "highScore";
  }

  String _getIsHighScoreFieldName(CampaignLevel gameLevel) {
    return gameLevel.name + "isHighScore";
  }

  void clearLevelsPlayed(CampaignLevel gameLevel) {
    setIsHighScore(gameLevel, false);
    prefs.setString(_getLevelsWonFieldName(gameLevel), "");
    prefs.setString(_getLevelsLostFieldName(gameLevel), "");
    prefs.setString(_getLevelsImageShownFieldName(gameLevel), "");
  }
}
