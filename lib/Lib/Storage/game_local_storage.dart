import 'package:flutter_app_quiz_game/Lib/Storage/my_local_storage.dart';

class GameLocalStorage extends MyLocalStorage {
  static final GameLocalStorage singleton = GameLocalStorage.internal();

  factory GameLocalStorage() {
    return singleton;
  }

  GameLocalStorage.internal();

  int getTotalPlayedQuestions() {
    return localStorage.getInt(_getTotalPlayedQuestionsFieldName()) ?? 0;
  }

  void incrementTotalPlayedQuestions() {
    localStorage.setInt(
        _getTotalPlayedQuestionsFieldName(), getTotalPlayedQuestions() + 1);
  }

  String _getTotalPlayedQuestionsFieldName() {
    return localStorageName + "_TotalPlayedQuestions";
  }
}
