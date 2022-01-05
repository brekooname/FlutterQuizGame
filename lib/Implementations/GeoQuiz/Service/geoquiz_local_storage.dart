import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class GeoQuizLocalStorage extends QuizGameLocalStorage {
  static final GeoQuizLocalStorage singleton = GeoQuizLocalStorage.internal();

  factory GeoQuizLocalStorage() {
    return singleton;
  }

  GeoQuizLocalStorage.internal();

}
