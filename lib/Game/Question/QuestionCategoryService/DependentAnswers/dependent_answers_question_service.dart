import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_parser.dart';

import '../Base/question_service.dart';

class DependentAnswersQuestionService extends QuestionService {
  late DependentAnswersQuestionParser questionParser;

  static final DependentAnswersQuestionService singleton =
      DependentAnswersQuestionService.internal();

  factory DependentAnswersQuestionService(
      {required DependentAnswersQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  DependentAnswersQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question);
  }

  @override
  String getQuestionExplanation(Question question) {
    return questionParser.getQuestionExplanation(question);
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return questionParser.getPrefixCodeForQuestion(question.rawString);
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return questionParser.getAllPossibleAnswersForQuestion(question, false, 3);
  }
}
