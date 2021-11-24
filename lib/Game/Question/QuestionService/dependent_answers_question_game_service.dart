import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/quiz_game_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
class DependentAnswersQuestionService extends QuizQuestionService {


  static final DependentAnswersQuestionService singleton = DependentAnswersQuestionService.internal();

  factory DependentAnswersQuestionService() {
    return singleton;
  }

  DependentAnswersQuestionService.internal();

  QuestionParser questionParser = QuestionParser();

  @override
  String getRandomUnpressedAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getAnswers(question);
    answers.shuffle();
    return answers.first;
  }

  @override
  List<String> getAnswers(Question question) {
    return questionParser.getAnswers(question.rawString);
  }

  @override
  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      Question question) {
    return questionParser.getAllAnswerOptionsForQuestion(
        allQuestionsWithConfig, question);
  }
}
