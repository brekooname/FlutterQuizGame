import 'package:flutter_app_quiz_game/Game/Question/QuestionService/quiz_game_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';

import '../category_difficulty.dart';

class UniqueAnswersQuestionService extends QuizQuestionService {

  static final UniqueAnswersQuestionService singleton = UniqueAnswersQuestionService.internal();

  factory UniqueAnswersQuestionService() {
    return singleton;
  }

  UniqueAnswersQuestionService.internal();

  @override
  List<String> getAnswers(Question question) {
    List<String> answers = [];
    List<String> pressedAnswersArray = getCorrectAnswerIds(question);
    List<String> answerOptionsArray = getAnswerOptionsArray(question);
    for (String answerId in pressedAnswersArray) {
      answers.add(answerOptionsArray[int.parse(answerId)]);
    }
    answers.shuffle();
    return answers;
  }

  @override
  String getRandomUnpressedAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    return getUnpressedCorrectAnswers(question, pressedAnswers).first;
  }

  @override
  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      Question question) {
    List<String> answerOptions = [];
    for (String answer in getAnswerOptionsArray(question)) {
      answerOptions.add(answer.trim());
    }
    answerOptions.shuffle();
    return answerOptions;
  }

  List<String> getCorrectAnswerIds(Question question) {
    return question.rawString.split(":")[3].split(",");
  }

  List<String> getAnswerOptionsArray(Question question) {
    return question.rawString.split(":")[2].split("##");
  }
}
