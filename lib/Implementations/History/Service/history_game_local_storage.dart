import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class HistoryLocalStorage extends QuizGameLocalStorage {
  static final HistoryLocalStorage singleton = HistoryLocalStorage.internal();

  factory HistoryLocalStorage() {
    return singleton;
  }

  HistoryLocalStorage.internal();
}
