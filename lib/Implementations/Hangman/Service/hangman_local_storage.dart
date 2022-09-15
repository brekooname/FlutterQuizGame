import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class HangmanLocalStorage extends QuizGameLocalStorage {
  static final HangmanLocalStorage singleton = HangmanLocalStorage.internal();

  factory HangmanLocalStorage() {
    return singleton;
  }

  HangmanLocalStorage.internal();
}
