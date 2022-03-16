import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class AnatomyLocalStorage extends QuizGameLocalStorage {
  static final AnatomyLocalStorage singleton = AnatomyLocalStorage.internal();

  factory AnatomyLocalStorage() {
    return singleton;
  }

  AnatomyLocalStorage.internal();
}
