import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class SkelLocalStorage extends QuizGameLocalStorage {
  static final SkelLocalStorage singleton = SkelLocalStorage.internal();

  factory SkelLocalStorage() {
    return singleton;
  }

  SkelLocalStorage.internal();
}
