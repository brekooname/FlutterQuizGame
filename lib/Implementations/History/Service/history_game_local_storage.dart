import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/my_local_storage.dart';

class HistoryLocalStorage extends MyLocalStorage {
  static final HistoryLocalStorage singleton = HistoryLocalStorage.internal();

  factory HistoryLocalStorage() {
    return singleton;
  }

  HistoryLocalStorage.internal();

  int getHighScore(CampaignLevel gameLevel) {
    return localStorage.getInt(_getHighScoreFieldName(gameLevel)) ?? 0;
  }

  void setHighScore(int score, CampaignLevel gameLevel) {
    if (score > getHighScore(gameLevel)) {
      localStorage.setInt(_getHighScoreFieldName(gameLevel), score);
    }
  }

  String _getHighScoreFieldName(CampaignLevel gameLevel) {
    return localStorageName + "_" + gameLevel.name + "_highScore";
  }
}
