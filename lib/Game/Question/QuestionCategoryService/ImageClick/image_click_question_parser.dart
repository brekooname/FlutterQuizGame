import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../Base/question_parser.dart';

class ImageClickQuestionParser extends QuestionParser {
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
    Question? questionRef = getQuestionForRef(question.index);
    if (questionRef == null) {
      return [];
    }
    return [questionRef.rawString.split(":")[0]];
  }

  Set<String> getAnswerOptions(String questionRawString) {
    List<String> answers = questionRawString
        .split(":")[1]
        .split(",")
        .where((element) => element.trim().isNotEmpty)
        .toList();
    Set<String> possibleAnswersResult = {};
    var answerIntList =
        answers.isEmpty ? [] : answers.map((e) => e.parseToInt).toList();
    for (int index in answerIntList) {
      Question? questionForIndex = getQuestionForRef(index);
      if (questionForIndex == null) {
        continue;
      }
      possibleAnswersResult
          .addAll(getCorrectAnswersFromRawString(questionForIndex));
    }
    return possibleAnswersResult;
  }

  Question? getQuestionForRef(int index) {
    return questionCollectorService
        .getAllQuestions()
        .firstWhereOrNull((element) => element.index == index);
  }
}
