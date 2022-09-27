import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Hangman/hangman_service.dart';

import '../Base/question_service.dart';
import 'hangman_question_parser.dart';

class HangmanQuestionService extends QuestionService {
  final int nrOfHangmanLives = 8;
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
  bool isAnswerCorrectInQuestion(List<String> correctAnswers, String answer) {
    return areHangmanWordsEqual(correctAnswers.join(), answer);
  }

  @override
  bool isGameFinishedSuccessful(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return pressedAnswers
        .map((e) => e.toLowerCase())
        .toSet()
        .containsAll(correctAnswers.map((e) => e.toLowerCase()).toSet());
  }

  @override
  bool isGameFinishedFailed(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    return _getNrOfWrongAnswersPressed(correctAnswers, pressedAnswers) >
        nrOfHangmanLives;
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return _hangmanService.availableLetters.split(",").toSet();
  }

  bool areHangmanWordsEqual(String hangmanWord, String answer) {
    hangmanWord = _hangmanService.normalizeString(hangmanWord);
    answer = _hangmanService.normalizeString(answer);
    return hangmanWord.toLowerCase().contains(answer.toLowerCase());
  }

  @override
  int getNrOfWrongAnswersPressed(
      Question question, Set<String> pressedAnswers) {
    return _getNrOfWrongAnswersPressed(
        getCorrectAnswers(question), pressedAnswers);
  }

  int _getNrOfWrongAnswersPressed(
      List<String> correctAnswers, Iterable<String> pressedAnswers) {
    Set<String> answerIds = pressedAnswers.map((e) => e.toLowerCase()).toSet();
    answerIds.removeAll(correctAnswers.map((e) => e.toLowerCase()).toSet());
    return answerIds.length;
  }
}
