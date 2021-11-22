import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

abstract class GameQuestionConfig {
  List<QuestionCategory> categories();

  List<QuestionDifficulty> difficulties();
}
