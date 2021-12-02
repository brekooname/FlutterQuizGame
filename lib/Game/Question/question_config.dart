import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';

class QuestionConfig {
  Set<QuestionDifficulty> difficulties;
  Set<QuestionCategory> categories;
  int amountOfQuestions;
  int hints;

  QuestionConfig(this.difficulties, this.categories, this.amountOfQuestions, this.hints);

  CategoryDifficulty getRandomCategoryAndDifficulty() {
    QuestionDifficulty randomQuestionDifficulty = getRandomQuestionDifficulty();
    List<QuestionCategory> categories = randomQuestionDifficulty.categories;
    categories.shuffle();
    for (QuestionCategory category in categories) {
      if (!categories.contains(category)) {
        categories.remove(category);
      }
    }
    return CategoryDifficulty(
        categories.first, randomQuestionDifficulty);
  }

  QuestionDifficulty getRandomQuestionDifficulty() {
    Set<QuestionDifficulty> list = difficulties;
    return list.first;
  }

  QuestionCategory getRandomQuestionCategory() {
    Set<QuestionCategory> list = categories;
    return list.first;
  }
}
