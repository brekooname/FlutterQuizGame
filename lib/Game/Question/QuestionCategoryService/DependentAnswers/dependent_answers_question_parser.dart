import 'dart:collection';

import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';

import '../question_parser.dart';

class DependentAnswersQuestionParser extends QuestionParser {
  //We return a list in case of multiple correct answers
  // but for this case there is only one correct answer
  @override
  List<String> getCorrectAnswersFromRawString(String questionString) {
    return [questionString.split(":")[1]];
  }

  @override
  String getQuestionToBeDisplayed(String questionRawString) {
    return questionRawString.split(":")[0];
  }

  int getPrefixCodeForQuestion(String questionRawString) {
    var val = questionRawString.split(":")[3];
    return val.isEmpty ? 0 : int.parse(val);
  }

  List<int> getAnswerReferences(String questionRawString) {
    List<String> answers = questionRawString.split(":")[2].split(",");
    return answers.map((e) => int.parse(e.trim())).toList();
  }

  Set<String> getAllPossibleAnswersForQuestion(
      Question question,
      bool includeAllDifficulties,
      int defaultNrOfPossibleAnswersWithoutCorrectOne) {
    List<Question> allQuestionsForCategory =
        getQuestionsToChooseAsPossibleAnswers(includeAllDifficulties, question);

    var answerReferences = getAnswerReferences(question.rawString);

    Set<String> possibleAnswersResult = Set();
    possibleAnswersResult
        .addAll(getCorrectAnswersFromRawString(question.rawString));
    if (answerReferences.isEmpty) {
      possibleAnswersResult.addAll(
          getPossibleAnswersInCaseNoReferencesWereSpecified(
              allQuestionsForCategory,
              defaultNrOfPossibleAnswersWithoutCorrectOne));
    } else {
      possibleAnswersResult.addAll(getPossibleAnswersForSpecifiedReferences(
          answerReferences, allQuestionsForCategory));
    }
    return possibleAnswersResult.map((e) => e.capitalize()).toSet();
  }

  List<Question> getQuestionsToChooseAsPossibleAnswers(
      bool includeAllDifficulties, Question question) {
    return includeAllDifficulties
        ? questionCollectorService.getAllQuestionsForCategory(question.category)
        : questionCollectorService.getAllQuestionsForCategoriesAndDifficulties(
            [question.difficulty], [question.category]);
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
          .addAll(getCorrectAnswersFromRawString(questionForIndex.rawString));
    }
    return possibleAnswersResult;
  }

  Set<String> getPossibleAnswersInCaseNoReferencesWereSpecified(
      List<Question> allQuestionsForCategory,
      int defaultNrOfPossibleAnswersWithoutCorrectOne) {
    allQuestionsForCategory.shuffle();
    int i = 0;
    Set<String> possibleAnswersResult = HashSet();
    while (possibleAnswersResult.length <
        defaultNrOfPossibleAnswersWithoutCorrectOne) {
      if (allQuestionsForCategory.length < i + 1) {
        break;
      }
      possibleAnswersResult.addAll(
          getCorrectAnswersFromRawString(allQuestionsForCategory[i].rawString));
      i++;
    }
    return possibleAnswersResult;
  }
}
