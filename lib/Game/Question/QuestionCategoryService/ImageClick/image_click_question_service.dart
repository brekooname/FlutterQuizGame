import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/Base/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';

import '../../../../main.dart';
import '../../Model/question.dart';
import '../../Model/question_category.dart';
import '../../Model/question_difficulty.dart';
import '../../question_collector_service.dart';

class ImageClickQuestionService extends QuestionService {
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
    List<Question> allQuestions = MyApp
        .appId.gameConfig.questionCollectorService
        .getAllQuestionsForCategory(questionCategory);
    Map<MyButton, ImageClickInfo> buttonWithCoordinates =
        HashMap<MyButton, ImageClickInfo>();
    for (Question question in allQuestions) {
      for (MyButton button in allAnswerOptionsButtons) {
        if (button.text != null &&
            (button.text ?? "").toLowerCase() ==
                questionParser
                    .getCorrectAnswersFromRawString(question)
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
    return questionParser.getCorrectAnswersFromRawString(question);
  }

  @override
  Set<String> getQuizAnswerOptions(Question question) {
    return {};
  }

  @override
  bool isAnswerCorrectInQuestion(Question question, String answer) {
    return true;
  }

  @override
  bool isGameFinishedFailed(
      Question question, Iterable<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        !isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  bool isGameFinishedSuccessful(
      Question question, Iterable<String> pressedAnswers) {
    return pressedAnswers.isNotEmpty &&
        isAnswerCorrectInQuestion(question, pressedAnswers.first);
  }

  @override
  List<String> getUnpressedCorrectAnswers(
      Question question, Set<String> pressedAnswers) {
    return getAnswers(question);
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
