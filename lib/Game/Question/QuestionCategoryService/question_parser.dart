import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../Model/category_difficulty.dart';
import '../question_collector_service.dart';

abstract class QuestionParser {
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();

  List<String> getAnswers(String questionString) {
    var split = questionString.split(":")[2];
    return split.isNotEmpty? split.split(",") : ;
  }

  List<String> get

  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
      Question question) {
    List<String> answerOptions = getAnswers(question.rawString);
    List<Question> allQuestionsForCategory = _questionCollectorService
        .getAllQuestionsForCategory(allQuestionsWithConfig, question.category);
    var answerIds =
        _questionCollectorService.getAnswerIds(question.rawString, 3);
    for (String index in answerIds) {
      var questionForIndex = _questionCollectorService.getQuestionForIndex(
          index, allQuestionsForCategory);
      if (questionForIndex == null) {
        continue;
      }
      answerOptions.addAll(getAnswers(questionForIndex.rawString));
    }
    answerOptions.shuffle();
    List<String> result = [];
    for (String answer in answerOptions) {
      result.add(answer.capitalize());
    }
    return result;
  }

  bool isQuestionValid(Question question) {
    return true;
  }
}
