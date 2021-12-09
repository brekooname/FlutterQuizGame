import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';

class CategoryDifficulty {
  QuestionCategory category;
  QuestionDifficulty difficulty;

  CategoryDifficulty(this.category, this.difficulty);

  @override
  String toString() {
    return 'CategoryAndDifficulty{category: $category, difficulty: $difficulty}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CategoryDifficulty &&
              category == other.category &&
              difficulty == other.difficulty;

  @override
  int get hashCode =>
      category.hashCode ^
      difficulty.hashCode;


}
