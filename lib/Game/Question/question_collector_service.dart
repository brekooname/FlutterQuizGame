import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Constants/language.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import 'Model/category_difficulty.dart';

class QuestionCollectorService {
  static final QuestionCollectorService singleton =
      QuestionCollectorService.internal();

  factory QuestionCollectorService() {
    return singleton;
  }

  QuestionCollectorService.internal();

  List<Question> getAllQuestionsForCategory(
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
      QuestionCategory questionCategory) {
    var difficulties =
        allQuestionsWithConfig.entries.map((e) => e.key.difficulty).toList();
    return getAllQuestionsForCategoriesAndDifficulties(
      allQuestionsWithConfig,
      [questionCategory],
      difficulties,
    );
  }

  Question? getQuestionForIndex(String fileId, List<Question> allQuestions) {
    for (Question question in allQuestions) {
      if (question.rawString.split(":")[0] == fileId) {
        return question;
      }
    }
    return null;
  }

  List<String> getAnswerIds(String questionString, int position) {
    List<String> answers = questionString.split(":")[position].split(",");
    List<String> toReturn = [];
    for (String answer in answers) {
      toReturn.add(answer.trim());
    }
    return toReturn;
  }

  List<Question> getAllQuestionsForCategoriesAndDifficulties(
    Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
    List<QuestionCategory> categories,
    List<QuestionDifficulty> difficultyLevels,
  ) {
    List<Question> questions = [];
    for (QuestionCategory category in categories) {
      for (QuestionDifficulty difficultyLevel in difficultyLevels) {
        List<Question> categQ = allQuestionsWithConfig
                .get(CategoryDifficulty(category, difficultyLevel)) ??
            [];
        for (int i = 0; i < categQ.length; i++) {
          questions.add(categQ[i]);
        }
      }
    }
    return questions;
  }
}
