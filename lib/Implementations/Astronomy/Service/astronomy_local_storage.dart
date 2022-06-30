import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class AstronomyLocalStorage extends QuizGameLocalStorage {
  static final AstronomyLocalStorage singleton = AstronomyLocalStorage.internal();

  factory AstronomyLocalStorage() {
    return singleton;
  }

  AstronomyLocalStorage.internal();
}
