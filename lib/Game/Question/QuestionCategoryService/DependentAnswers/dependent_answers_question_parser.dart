import 'dart:collection';

import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../Base/question_parser.dart';

class DependentAnswersQuestionParser extends QuestionParser {
  static final DependentAnswersQuestionParser singleton =
      DependentAnswersQuestionParser.internal();

  factory DependentAnswersQuestionParser() {
    return singleton;
  }

  DependentAnswersQuestionParser.internal();

  //We return a list in case of multiple correct answers
  // but for this case there is only one correct answer
  @override
  List<String> getCorrectAnswersFromRawString(Question question) {
    return [question.rawString.split(":")[1].trim()];
  }

  @override
  String getQuestionToBeDisplayed(Question question) {
    return question.rawString.split(":")[0].trim();
  }

  int getPrefixCodeForQuestion(String questionRawString) {
    var val = questionRawString.split(":")[3].trim();
    return val.isEmpty ? 0 : val.parseToInt;
  }

  List<int> getAnswerReferences(String questionRawString) {
    List<String> answers = questionRawString
        .split(":")[2]
        .split(",")
        .where((element) => element.trim().isNotEmpty)
        .toList();
    return answers.isEmpty ? [] : answers.map((e) => e.parseToInt).toList();
  }

  Set<String> getAllPossibleAnswersForQuestion(
      Question question,
      bool includeAllDifficulties,
      int defaultNrOfPossibleAnswersWithoutCorrectOne) {
    List<Question> allQuestionsForCategory =
        getQuestionsToChooseAsPossibleAnswers(includeAllDifficulties, question);

    var answerReferences = getAnswerReferences(question.rawString);

    Set<String> possibleAnswersResult = {};
    var correctAnswerForCurrentQuestion =
        getCorrectAnswersFromRawString(question).first;
    possibleAnswersResult.add(correctAnswerForCurrentQuestion);
    if (answerReferences.isEmpty) {
      possibleAnswersResult.addAll(
          getPossibleAnswersInCaseNoReferencesWereSpecified(
              correctAnswerForCurrentQuestion,
              allQuestionsForCategory,
              defaultNrOfPossibleAnswersWithoutCorrectOne));
    } else {
      possibleAnswersResult.addAll(getPossibleAnswersForSpecifiedReferences(
          answerReferences, allQuestionsForCategory));
    }
    return possibleAnswersResult.map((e) => e.capitalized).toSet();
  }

  List<Question> getQuestionsToChooseAsPossibleAnswers(
      bool includeAllDifficulties, Question question) {
    return includeAllDifficulties
        ? questionCollectorService
            .getAllQuestions(categories: [question.category])
        : questionCollectorService.getAllQuestions(
            difficulties: [question.difficulty],
            categories: [question.category]);
  }

  Set<String> getPossibleAnswersForSpecifiedReferences(
      List<int> answerReferences, List<Question> allQuestionsForCategory) {
    Set<String> possibleAnswersResult = HashSet();
    for (int index in answerReferences) {
      Question? questionForIndex = allQuestionsForCategory
          .firstWhereOrNull((element) => element.index == index);
      if (questionForIndex == null) {
        continue;
      }
      possibleAnswersResult
          .addAll(getCorrectAnswersFromRawString(questionForIndex));
    }
    return possibleAnswersResult;
  }

  Set<String> getPossibleAnswersInCaseNoReferencesWereSpecified(
      String correctAnswerForCurrentQuestion,
      List<Question> allQuestionsForCategory,
      int defaultNrOfPossibleAnswersWithoutCorrectOne) {
    List<Question> questionsToProcess = List.of(allQuestionsForCategory);
    questionsToProcess.shuffle();
    int i = 0;
    Set<String> possibleAnswersResult = HashSet();
    while (possibleAnswersResult.length <
            defaultNrOfPossibleAnswersWithoutCorrectOne &&
        questionsToProcess.length >= i + 1) {
      String correctAnswerFromRawString =
          getCorrectAnswersFromRawString(questionsToProcess[i]).first;

      if (correctAnswerForCurrentQuestion != correctAnswerFromRawString) {
        possibleAnswersResult.add(correctAnswerFromRawString);
      }

      i++;
    }
    return possibleAnswersResult;
  }
}
