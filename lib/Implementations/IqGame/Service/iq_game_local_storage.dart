import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class IqGameLocalStorage extends QuizGameLocalStorage {
  static final IqGameLocalStorage singleton = IqGameLocalStorage.internal();

  factory IqGameLocalStorage() {
    return singleton;
  }

  IqGameLocalStorage.internal();
}
