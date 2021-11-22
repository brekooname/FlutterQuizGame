import 'package:flutter_app_quiz_game/Game/Constants/hint_button_type.dart';
import 'package:flutter_app_quiz_game/Game/Game/GameService/game_service.dart';

abstract class QuestionTypeService {

  GameService getGameService();

  HintButtonType getHintButtonType();
}