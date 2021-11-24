import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class CategoryAndDifficulty {
  QuestionCategory category;
  QuestionDifficulty difficulty;

  CategoryAndDifficulty(this.category, this.difficulty);

  @override
  String toString() {
    return 'CategoryAndDifficulty{category: $category, difficulty: $difficulty}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CategoryAndDifficulty &&
              category == other.category &&
              difficulty == other.difficulty;

  @override
  int get hashCode =>
      category.hashCode ^
      difficulty.hashCode;


}
