import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';

import '../question_service.dart';

class UniqueAnswersQuestionService extends QuestionService {
  late QuestionParser questionParser;

  static final UniqueAnswersQuestionService singleton =
      UniqueAnswersQuestionService.internal();

  factory UniqueAnswersQuestionService(
      {required QuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  UniqueAnswersQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0];
  }

  @override
  List<String> getCorrectAnswers(Question question) {
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
  String getRandomUnpressedCorrectAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    return getUnpressedCorrectAnswers(question, pressedAnswers).first;
  }

  @override
  Set<String> getAllAnswerOptionsForQuestion(Question question) {
    return getAnswerOptionsArray(question).map((e) => e.trim()).toSet();
  }

  List<String> getCorrectAnswerIds(Question question) {
    return question.rawString.split(":")[3].split(",");
  }

  List<String> getAnswerOptionsArray(Question question) {
    return question.rawString.split(":")[2].split("##");
  }
}
