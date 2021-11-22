import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/random_difficulty_category.dart';

class QuestionConfig {
  List<QuestionDifficulty> difficulties;
  List<QuestionCategory> categories;
  int amountOfQuestions;
  int hints;

  QuestionConfig(this.difficulties, this.categories, this.amountOfQuestions, this.hints);

  RandomCategoryAndDifficulty getRandomCategoryAndDifficulty() {
    QuestionDifficulty randomQuestionDifficulty = getRandomQuestionDifficulty();
    List<QuestionCategory> categories = randomQuestionDifficulty.categories;
    categories.shuffle();
    for (QuestionCategory category in categories) {
      if (!categories.contains(category)) {
        categories.remove(category);
      }
    }
    return RandomCategoryAndDifficulty(
        categories.first, randomQuestionDifficulty);
  }

  QuestionDifficulty getRandomQuestionDifficulty() {
    List<QuestionDifficulty> list = difficulties;
    list.shuffle();
    return list.first;
  }

  QuestionCategory getRandomQuestionCategory() {
    List<QuestionCategory> list = categories;
    categories.shuffle();
    return list.first;
  }
}
