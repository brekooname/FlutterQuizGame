import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

class SkelComponentsService extends QuizGameLocalStorage {
  static final SkelComponentsService singleton = SkelComponentsService.internal();

  factory SkelComponentsService() {
    return singleton;
  }

  SkelComponentsService.internal();
}
