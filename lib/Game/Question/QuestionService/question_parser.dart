import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../category_difficulty.dart';
import '../question_difficulty.dart';

class QuestionParser {
  List<String> getAnswers(String questionString) {
    return [questionString.split(":")[2]];
  }

  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
      Question question) {
    List<String> answerOptions = getAnswers(question.rawString);
    List<Question> allQuestionsForCategory =
        getAllQuestionsForCategory(allQuestionsWithConfig, question.category);
    var answerIds = getAnswerIds(question.rawString, 3);
    for (String fileId in answerIds) {
      var questionForFileId =
          getQuestionForFileId(fileId, allQuestionsForCategory);
      if (questionForFileId == null) {
        continue;
      }
      answerOptions.addAll(getAnswers(questionForFileId.rawString));
    }
    answerOptions.shuffle();
    List<String> result = [];
    for (String answer in answerOptions) {
      result.add(answer.capitalize());
    }
    return result;
  }

  List<Question> getAllQuestionsForCategory(
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
      QuestionCategory questionCategory) {
    var difficulties =
        allQuestionsWithConfig.entries.map((e) => e.key.difficulty).toList();
    return getAllQuestionsForCategoryAndDifficulties(
      allQuestionsWithConfig,
      questionCategory,
      difficulties,
    );
  }

  Question? getQuestionForFileId(String fileId, List<Question> allQuestions) {
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

  List<Question> getAllQuestionsForCategoryAndDifficulty(
    Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
    QuestionCategory category,
    QuestionDifficulty difficulty,
  ) {
    return getAllQuestionsForCategoryAndDifficulties(
        allQuestionsWithConfig, category, [difficulty]);
  }

  List<Question> getAllQuestionsForCategoryAndDifficulties(
    Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
    QuestionCategory category,
    List<QuestionDifficulty> difficultyLevels,
  ) {
    List<Question> questions = [];
    for (QuestionDifficulty difficultyLevel in difficultyLevels) {
      List<Question> categQ = allQuestionsWithConfig
              .get(CategoryDifficulty(category, difficultyLevel)) ??
          [];
      for (int i = 0; i < categQ.length; i++) {
        questions.add(categQ[i]);
      }
    }
    return questions;
  }

  bool isQuestionValid(Question question) {
    return true;
  }
}
