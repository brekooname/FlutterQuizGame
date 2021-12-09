import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/DependentAnswers/dependent_answers_question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/quiz_game_service.dart';

class DependentAnswersQuestionService extends QuizQuestionService {
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
  String getRandomUnpressedAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getAnswers(question);
    answers.shuffle();
    return answers.first;
  }

  @override
  List<String> getAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question.rawString);
  }

  @override
  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig,
      Question question) {
    return questionParser.getAllPossibleAnswersForQuestion(
        allQuestionsWithConfig, question, false, 3);
  }
}
