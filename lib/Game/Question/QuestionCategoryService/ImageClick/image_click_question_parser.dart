import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../Base/question_parser.dart';

class ImageClickQuestionParser extends QuestionParser {
  ScreenDimensionsService screenDimensions = ScreenDimensionsService();
  static final ImageClickQuestionParser singleton =
      ImageClickQuestionParser.internal();

  factory ImageClickQuestionParser() {
    return singleton;
  }

  ImageClickQuestionParser.internal();

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0].trim();
  }

  //We return a list in case of multiple correct answers
  // but for this case there is only one correct answer
  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    Question? questionOpt = getQuestionForRef(
        question.index, question.difficulty, question.category);
    if (questionOpt == null) {
      return [];
    }
    return [questionOpt.rawString.split(":")[0]];
  }

  ImageClickInfo getAnswerOptionCoordinates(Question question) {
    List<String> s = question.rawString
        .split(":")[2]
        .split(",")
        .where((element) => element.trim().isNotEmpty)
        .toList();
    ImageClickInfo imageClickInfo = ImageClickInfo(
        x: double.parse(s[0]),
        y: double.parse(s[1]),
        arrowWidth: screenDimensions.dimen(30),
        answerLabel: getQuestionToBeDisplayed(question));
    if (s.length == 3) {
      imageClickInfo.arrowWidth = screenDimensions.dimen(double.parse(s[2]));
    }
    return imageClickInfo;
  }

  Set<Question> getAnswerOptionQuestions(Question question) {
    List<String> answers = question.rawString
        .split(":")[1]
        .split(",")
        .where((element) => element.trim().isNotEmpty)
        .toList();
    Set<Question> possibleAnswersResult = {};
    possibleAnswersResult.add(question);
    var answerIntList =
        answers.isEmpty ? [] : answers.map((e) => e.parseToInt).toList();
    for (int index in answerIntList) {
      Question? questionForRef =
          getQuestionForRef(index, question.difficulty, question.category);
      if (questionForRef == null) {
        continue;
      }
      possibleAnswersResult.add(questionForRef);
    }
    return possibleAnswersResult;
  }

  Set<String> getAnswerOptions(Question question) {
    Set<String> possibleAnswersResult = {};
    var answerOptionQuestions = getAnswerOptionQuestions(question);
    for (Question q in answerOptionQuestions) {
      possibleAnswersResult.addAll(getCorrectAnswersFromRawString(q));
    }
    return possibleAnswersResult;
  }

  Question? getQuestionForRef(
    int index,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return questionCollectorService.getAllQuestions().firstWhereOrNull((q) =>
        q.index == index &&
        q.difficulty == difficulty &&
        q.category == category);
  }
}

class ImageClickInfo {
  double x;
  double y;
  String answerLabel;
  double arrowWidth;

  ImageClickInfo({
    required this.x,
    required this.y,
    required this.answerLabel,
    required this.arrowWidth,
  });
}
