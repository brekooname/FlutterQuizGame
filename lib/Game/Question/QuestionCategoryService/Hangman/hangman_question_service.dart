import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';

import '../Base/question_service.dart';
import 'hangman_question_parser.dart';

class HangmanQuestionService extends QuestionService {
  final HangmanService _hangmanService = HangmanService();
  late HangmanQuestionParser questionParser;

  static final HangmanQuestionService singleton =
      HangmanQuestionService.internal();

  factory HangmanQuestionService(
      {required HangmanQuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  HangmanQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return questionParser.getQuestionToBeDisplayed(question);
  }

  @override
  int getPrefixCodeForQuestion(Question question) {
    return -1;
  }

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return compareAnswerStrings(question.questionToBeDisplayed, answer);
  }

  @override
  bool isGameFinishedSuccessful(
      Question question, Iterable<String> pressedAnswers) {
    return pressedAnswers.toSet().containsAll(_hangmanService
        .getNormalizedWordLetters(question.questionToBeDisplayed));
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return _hangmanService.availableLetters.split(",").toSet();
  }

  @override
  bool compareAnswerStrings(String hangmanWord, String answer) {
    hangmanWord = _hangmanService.normalizeString(hangmanWord);
    answer = _hangmanService.normalizeString(answer);
    return hangmanWord.toLowerCase().contains(answer.toLowerCase());
  }

  @override
  int getNrOfWrongAnswersPressed(
      Question question, Set<String> pressedAnswers) {
    Set<String> answerIds = pressedAnswers.toSet();
    answerIds.removeAll(_hangmanService
        .getNormalizedWordLetters(question.questionToBeDisplayed));
    return answerIds.length;
  }
}
