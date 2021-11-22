import 'dart:math';

import 'package:flutter_app_quiz_game/Components/Text/string_capitalize_extension.dart';
import 'package:flutter_app_quiz_game/File/file_util.dart';

import '../../game.dart';
import '../question.dart';
import '../question_category.dart';
import '../question_difficulty.dart';

class QuestionCreator {
  Question createRandomQuestion(QuestionDifficulty questionDifficulty,
      QuestionCategory questionCategory) {
    List<String> lines =
        FileUtil.getTextForConfig(questionDifficulty, questionCategory);
    int randomLine = Random().nextInt(lines.length);
    return Question(randomLine, questionDifficulty, questionCategory,
        lines.elementAt(randomLine).capitalize());
  }

  List<Question> getAllQuestions() {
    List<Question> questions = [];
    for (QuestionDifficulty difficulty
        in Game.getGameId().gameType.getGameQuestionConfig().difficulties()) {
      for (QuestionCategory category
          in Game.getGameId().gameType.getGameQuestionConfig().categories()) {
        var lines = FileUtil.getTextForConfig(difficulty, category);
        for (int i = 0; i < lines.length; i++) {
          questions.add(Question(i, difficulty, category, lines[i]));
        }
      }
    }

    return questions;
  }

  List<Question> getAllQuestionsForCategoryAndDifficulties(
      List<QuestionDifficulty> difficultyLevels,
      QuestionCategory categoryEnumToCreate) {
    List<Question> questions = [];
    for (QuestionDifficulty difficultyLevel in difficultyLevels) {
      List<String> lines =
          FileUtil.getTextForConfig(difficultyLevel, categoryEnumToCreate);
      for (int i = 0; i < lines.length; i++) {
        questions
            .add(Question(i, difficultyLevel, categoryEnumToCreate, lines[i]));
      }
    }
    return questions;
  }

  bool isQuestionValid(Question question) {
    return true;
  }
}
