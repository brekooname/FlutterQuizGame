import 'package:flutter_app_quiz_game/Util/map_extension.dart';

import '../../game.dart';
import '../category_difficulty.dart';
import '../question.dart';
import '../question_category.dart';
import '../question_difficulty.dart';

class QuestionCreator {
  List<Question> getAllQuestions(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig) {
    List<Question> questions = [];
    var difficulties = Game.getGameId().gameConfig.questionDifficulties();
    var categories = Game.getGameId().gameConfig.questionCategories();
    for (QuestionDifficulty difficulty in difficulties) {
      for (QuestionCategory category in categories) {
        var categoryAndDifficulty = CategoryAndDifficulty(category, difficulty);
        var lines = allQuestionsWithConfig.get(categoryAndDifficulty) ?? [];
        for (int i = 0; i < lines.length; i++) {
          questions.add(Question(i, difficulty, category, lines[i]));
        }
      }
    }

    return questions;
  }

  List<Question> getAllQuestionsForCategoryAndDifficulty(
    Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
    QuestionCategory category,
    QuestionDifficulty difficulty,
  ) {
    return getAllQuestionsForCategoryAndDifficulties(
        allQuestionsWithConfig, category, [difficulty]);
  }

  List<Question> getAllQuestionsForCategoryAndDifficulties(
    Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
    QuestionCategory category,
    List<QuestionDifficulty> difficultyLevels,
  ) {
    List<Question> questions = [];
    for (QuestionDifficulty difficultyLevel in difficultyLevels) {
      List<String> lines = allQuestionsWithConfig
              .get(CategoryAndDifficulty(category, difficultyLevel)) ??
          [];
      for (int i = 0; i < lines.length; i++) {
        questions.add(Question(i, difficultyLevel, category, lines[i]));
      }
    }
    return questions;
  }

  bool isQuestionValid(Question question) {
    return true;
  }
}
