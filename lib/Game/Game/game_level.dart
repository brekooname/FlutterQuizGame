import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class GameLevel {
  int index;
  String name;

  QuestionCategory category;
  QuestionDifficulty difficulty;

  GameLevel(
      {required this.index,
      required this.name,
      required this.category,
      required this.difficulty});
}
