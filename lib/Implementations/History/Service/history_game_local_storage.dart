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

  int getHighScore(CampaignLevel gameLevel) {
    return prefs.getInt(_getHighScoreFieldName(gameLevel)) ?? 0;
  }

  void setHighScore(int score, CampaignLevel gameLevel) {
    if (score > getHighScore(gameLevel)) {
      prefs.setInt(_getHighScoreFieldName(gameLevel), score);
    }
  }

  String _getHighScoreFieldName(CampaignLevel gameLevel) {
    return gameLevel.name + "highScore";
  }
}
