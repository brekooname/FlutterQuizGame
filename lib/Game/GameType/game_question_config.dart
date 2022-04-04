import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

abstract class GameQuestionConfig {
  late List<QuestionCategory> categories;

  late List<QuestionDifficulty> difficulties;

  Map<QuestionCategoryDifficultyWithPrefixCode, String> get prefixLabelForCode;

  String getPrefixToBeDisplayedForQuestion(QuestionCategory category,
      QuestionDifficulty difficulty, int prefixCode) {
    return prefixLabelForCode
        .getOrDefault<QuestionCategoryDifficultyWithPrefixCode, String>(
            QuestionCategoryDifficultyWithPrefixCode(
                category: category,
                difficulty: difficulty,
                prefixCode: prefixCode),
            prefixLabelForCode
                .getOrDefault<QuestionCategoryDifficultyWithPrefixCode, String>(
                    QuestionCategoryDifficultyWithPrefixCode(
                        category: category,
                        difficulty: null,
                        prefixCode: prefixCode),
                    ""));
  }
}

class QuestionCategoryDifficultyWithPrefixCode {
  QuestionCategory category;
  QuestionDifficulty? difficulty;
  int prefixCode;

  QuestionCategoryDifficultyWithPrefixCode(
      {required this.category, this.difficulty, required this.prefixCode});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionCategoryDifficultyWithPrefixCode &&
          runtimeType == other.runtimeType &&
          category == other.category &&
          difficulty == other.difficulty &&
          prefixCode == other.prefixCode;

  @override
  int get hashCode =>
      category.hashCode ^ difficulty.hashCode ^ prefixCode.hashCode;
}
