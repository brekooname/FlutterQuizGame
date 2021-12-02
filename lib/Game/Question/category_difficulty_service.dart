import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

import 'category_difficulty.dart';

abstract class CategoryDifficultyService {
  Map<CategoryDifficulty, List<Question>> getAllQuestions();

  void addQuestions(Map<CategoryDifficulty, List<Question>> result,
      QuestionCategory cat, QuestionDifficulty diff, List<String> strings) {
    var categoryDifficulty = CategoryDifficulty(
      cat,
      diff,
    );
    result.putIfAbsent(
        categoryDifficulty, () => createQuestions(categoryDifficulty, strings));
  }

  List<Question> createQuestions(
      CategoryDifficulty categoryDifficulty, List<String> strings) {
    List<Question> result = [];
    for (int i = 0; i < strings.length; i++) {
      result.add(Question(i, categoryDifficulty.difficulty,
          categoryDifficulty.category, strings[i]));
    }
    return result;
  }
}
