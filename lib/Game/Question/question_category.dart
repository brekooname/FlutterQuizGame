import 'package:flutter_app_quiz_game/Game/Game/GameService/game_service.dart';

abstract class QuestionCategory {
  int index;
  String name;
  GameService getGameService();

  QuestionCategory(this.index, this.name);
}
