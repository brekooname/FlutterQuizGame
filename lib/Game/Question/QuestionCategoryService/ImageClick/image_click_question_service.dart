import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';

import '../../Model/category_difficulty.dart';
import '../../Model/question.dart';
import '../../Model/question_category.dart';
import '../../Model/question_difficulty.dart';
import '../../question_collector_service.dart';

class ImageClickQuestionService extends QuestionService {
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();
  late QuestionParser questionParser;

  static final ImageClickQuestionService singleton =
      ImageClickQuestionService.internal();

  factory ImageClickQuestionService({required QuestionParser questionParser}) {
    singleton.questionParser = questionParser;
    return singleton;
  }

  ImageClickQuestionService.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0];
  }

  Map<MyButton, ImageClickInfo> getAnswerOptionsCoordinates(
      List<MyButton> allAnswerOptionsButtons,
      QuestionDifficulty questionDifficultyLevel,
      QuestionCategory questionCategory) {
    List<Question> allQuestions =
        _questionCollectorService.getAllQuestionsForCategory(questionCategory);
    Map<MyButton, ImageClickInfo> buttonWithCoordinates =
        HashMap<MyButton, ImageClickInfo>();
    for (Question question in allQuestions) {
      for (MyButton button in allAnswerOptionsButtons) {
        if (button.text != null &&
            (button.text ?? "").toLowerCase() ==
                questionParser
                    .getCorrectAnswersFromRawString(question.rawString)
                    .first
                    .toLowerCase()) {
          buttonWithCoordinates[button] =
              getAnswerOptionCoordinates(question.rawString);
          break;
        }
      }
    }
    return buttonWithCoordinates;
  }

  ImageClickInfo getAnswerOptionCoordinates(String questionString) {
    List<String> s = questionString
        .split(":")[4]
        .split(",")
        .where((element) => element.trim().isNotEmpty)
        .toList();
    ImageClickInfo imageClickInfo =
        ImageClickInfo(x: double.parse(s[0]), y: double.parse(s[1]));
    if (s.length == 3) {
      imageClickInfo.arrowWidth = double.parse(s[2]);
    }
    return imageClickInfo;
  }

  List<String> getAnswers(Question question) {
    return questionParser.getCorrectAnswersFromRawString(question.rawString);
  }

  @override
  int getImageToBeDisplayedPositionInString() {
    return 5;
  }

  @override
  int getQuestionToBeDisplayedPositionInString() {
    return 2;
  }

  @override
  Set<String> getAllAnswerOptionsForQuestion(Question question) {
    return Set();
  }

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return compareAnswerStrings(
        answer.toLowerCase(), getAnswers(question).first.toLowerCase());
  }

  @override
  bool isGameFinishedFailed(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        !isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  bool isGameFinishedSuccessful(Question question, Set<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    return getAnswers(question);
  }

  @override
  String getRandomUnpressedCorrectAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getAnswers(question);
    answers.shuffle();
    return answers.first;
  }

  @override
  List<String> getCorrectAnswers(Question question) {
    throw UnimplementedError();
  }
}

class ImageClickInfo {
  double x;
  double y;

  double? arrowWidth;

  ImageClickInfo({required this.x, required this.y, this.arrowWidth});
}
