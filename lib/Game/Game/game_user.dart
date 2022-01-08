import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/list_extension.dart';

class GameUser {
  final List<QuestionInfo> _allQuestionInfos = [];

  void setWonQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.isQuestionOpen()) {
      gameQuestionInfo.updateStatus(QuestionInfoStatus.WON);
    }
  }

  void resetQuestion(QuestionInfo gameQuestionInfo) {
    gameQuestionInfo.updateStatus(QuestionInfoStatus.OPEN);
    gameQuestionInfo.pressedAnswers.clear();
  }

  void setLostQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.isQuestionOpen()) {
      gameQuestionInfo.updateStatus(QuestionInfoStatus.LOST);
    }
  }

  QuestionInfo getRandomQuestion(
      QuestionDifficulty difficulty, QuestionCategory category) {
    List<QuestionInfo> res =
        getOpenQuestionsForConfig(difficulty, category).toList();
    res.shuffle();
    return res.first;
  }

  QuestionInfo? getMostRecentAnsweredQuestion(
      {List<QuestionInfoStatus>? questionInfoStatus,
      QuestionDifficulty? difficulty,
      QuestionCategory? category}) {
    var questionStatusToCheck = questionInfoStatus ?? QuestionInfoStatus.values;
    var questionInfo = _allQuestionInfos.where((element) {
      return questionStatusToCheck.contains(element.status) &&
          element.questionAnsweredAt != null &&
          (category == null || element.question.category == category) &&
          (difficulty == null || element.question.difficulty == difficulty);
    }).toList();
    questionInfo
        .sort((a, b) => b.questionAnsweredAt!.compareTo(a.questionAnsweredAt!));
    return questionInfo.firstOrNull;
  }

  QuestionInfo getQuestionInfo(Question question) {
    return getAllQuestionsForConfig(question.difficulty, question.category)
        .where((element) => element.question.index == question.index)
        .first;
  }

  Iterable<QuestionInfo> getOpenQuestions() {
    return getAllQuestions([QuestionInfoStatus.OPEN]);
  }

  Iterable<QuestionInfo> getOpenQuestionsForConfig(
      QuestionDifficulty difficulty, QuestionCategory category) {
    return getOpenQuestions().where((element) =>
        element.question.category == category &&
        element.question.difficulty == difficulty);
  }

  List<QuestionInfo> getAllQuestionsForConfig(
      QuestionDifficulty difficulty, QuestionCategory category) {
    return _allQuestionInfos
        .where((element) =>
            element.question.category == category &&
            element.question.difficulty == difficulty)
        .toList();
  }

  int countAllQuestions(List<QuestionInfoStatus> questionInfoStatus) {
    return getAllQuestions(questionInfoStatus).length;
  }

  List<QuestionInfo> getAllQuestions(
      List<QuestionInfoStatus> questionInfoStatus) {
    var questionStatusToCheck = questionInfoStatus.isEmpty
        ? QuestionInfoStatus.values
        : questionInfoStatus;
    return _allQuestionInfos
        .where((e) => questionStatusToCheck.contains(e.status))
        .toList();
  }

  bool addAnswerToQuestionInfo(Question question, String answerId) {
    QuestionInfo questionInfo = getQuestionInfo(question);
    questionInfo.addPressedAnswer(answerId);
    setQuestionFinishedStatus(questionInfo);
    return questionInfo.status == QuestionInfoStatus.WON;
  }

  void setQuestionFinishedStatus(QuestionInfo gameQuestionInfo) {
    QuestionService questionService = gameQuestionInfo.question.questionService;
    bool userSuccess = questionService.isGameFinishedSuccessful(
        gameQuestionInfo.question, gameQuestionInfo.pressedAnswers);
    if (userSuccess) {
      setWonQuestion(gameQuestionInfo);
    } else {
      bool userFail = questionService.isGameFinishedFailed(
          gameQuestionInfo.question, gameQuestionInfo.pressedAnswers);
      if (userFail) {
        setLostQuestion(gameQuestionInfo);
      }
    }
  }

  QuestionCategory? getNotPlayedRandomQuestionCategory() {
    var allOpenQuestions = getOpenQuestions().toList();
    List<QuestionCategory> availableCategories =
        allOpenQuestions.map((e) => e.question.category).toSet().toList();

    if (availableCategories.isEmpty) {
      //GAME OVER
      return null;
    } else if (availableCategories.length == 1) {
      return availableCategories.first;
    } else {
      QuestionInfo? mostRecentQuestion = getMostRecentAnsweredQuestion();

      if (mostRecentQuestion == null) {
        allOpenQuestions.shuffle();
        return allOpenQuestions.first.question.category;
      } else {
        availableCategories.remove(mostRecentQuestion.question.category);
        availableCategories.shuffle();

        return availableCategories.first;
      }
    }
  }

  void removeQuestionInfos(List<QuestionInfo> gameQuestionInfos) {
    _allQuestionInfos.removeAll(gameQuestionInfos);
  }

  void addQuestionInfoToList(QuestionInfo gameQuestionInfo) {
    _allQuestionInfos.add(gameQuestionInfo);
  }
}
