import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';

class QuestionConfig {
  Set<QuestionDifficulty> difficulties;
  Set<QuestionCategory> categories;
  int amountOfQuestions;
  int hints;

  QuestionConfig(this.difficulties, this.categories, this.amountOfQuestions, this.hints);

}
