import 'package:flutter_app_quiz_game/Util/string_extension.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';

import '../../game.dart';
import '../category_difficulty.dart';

class QuestionParser {
  List<String> getAnswers(String questionString) {
    return [questionString.split(":")[2]];
  }

  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      Question question) {
    List<String> answerOptions = getAnswers(question.rawString);
    List<Question> allQuestionsForCategory =
        getAllQuestionsForCategory(allQuestionsWithConfig, question.category);
    for (String fileId
        in QuestionParser().getAnswerIds(question.rawString, 3)) {
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
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      QuestionCategory questionCategory) {
    var gameConfig = Game.getGameId().gameConfig;
    return gameConfig
        .getQuestionCreator()
        .getAllQuestionsForCategoryAndDifficulties(
          allQuestionsWithConfig,
          questionCategory,
          gameConfig.questionDifficulties(),
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
}
