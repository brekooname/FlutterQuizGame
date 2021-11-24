import 'dart:collection';

import 'package:flutter_app_quiz_game/Components/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_parser.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';

import '../category_difficulty.dart';
import '../question.dart';
import '../question_category.dart';
import '../question_difficulty.dart';

class ImageClickQuestionService extends QuestionService {

  static final ImageClickQuestionService singleton = ImageClickQuestionService.internal();

  factory ImageClickQuestionService() {
    return singleton;
  }

  ImageClickQuestionService.internal();


  QuestionParser questionParser = QuestionParser();

  Map<MyButton, ImageClickInfo> getAnswerOptionsCoordinates(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      List<MyButton> allAnswerOptionsButtons,
      QuestionDifficulty questionDifficultyLevel,
      QuestionCategory questionCategory) {
    List<Question> allQuestions = questionParser.getAllQuestionsForCategory(
        allQuestionsWithConfig, questionCategory);
    Map<MyButton, ImageClickInfo> buttonWithCoordinates =
        HashMap<MyButton, ImageClickInfo>();
    for (Question question in allQuestions) {
      for (MyButton button in allAnswerOptionsButtons) {
        if (button.text != null &&
            (button.text ?? "").toLowerCase() ==
                questionParser
                    .getAnswers(question.rawString)
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
    List<String> s = questionString.split(":")[4].split(",");
    ImageClickInfo imageClickInfo =
        ImageClickInfo(x: double.parse(s[0]), y: double.parse(s[1]));
    if (s.length == 3) {
      imageClickInfo.arrowWidth = double.parse(s[2]);
    }
    return imageClickInfo;
  }

  List<String> getAnswers(Question question) {
    return questionParser.getAnswers(question.rawString);
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
  List<String> getAllAnswerOptionsForQuestion(
      Map<CategoryAndDifficulty, List<String>> allQuestionsWithConfig,
      Question question) {
    return questionParser.getAllAnswerOptionsForQuestion(
        allQuestionsWithConfig, question);
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
  int getNrOfWrongAnswersPressed(Set<String> pressedAnswers) {
    return 0;
  }

  @override
  String getRandomUnpressedAnswerFromQuestion(
      Question question, Set<String> pressedAnswers) {
    List<String> answers = getAnswers(question);
    answers.shuffle();
    return answers.first;
  }
}

class ImageClickInfo {
  double x;
  double y;

  double? arrowWidth;

  ImageClickInfo({required this.x, required this.y, this.arrowWidth});
}
