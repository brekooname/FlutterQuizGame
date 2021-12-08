import 'package:flutter_app_quiz_game/Game/Question/QuestionService/question_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info_status.dart';

class GameUser {
  List<QuestionInfo> _openQuestionInfos = [];
  List<QuestionInfo> _allQuestionInfos = [];

  void setWonQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.isQuestionOpen()) {
      gameQuestionInfo.status = QuestionInfoStatus.WON;
      _openQuestionInfos.remove(gameQuestionInfo);
    }
  }

  void resetQuestion(QuestionInfo gameQuestionInfo) {
    gameQuestionInfo.status = QuestionInfoStatus.OPEN;
    if (!_openQuestionInfos.contains(gameQuestionInfo)) {
      gameQuestionInfo.answers.clear();
      _openQuestionInfos.add(gameQuestionInfo);
    }
  }

  void setLostQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.isQuestionOpen()) {
      gameQuestionInfo.status = QuestionInfoStatus.LOST;
      _openQuestionInfos.remove(gameQuestionInfo);
    }
  }

  QuestionInfo getRandomQuestion(
      QuestionDifficulty difficulty, QuestionCategory category) {
    List<QuestionInfo> res =
        getOpenQuestionsForConfig(difficulty, category).toList();
    res.shuffle();
    return res.first;
  }

  QuestionInfo getFirstOpenQuestion(
      QuestionDifficulty difficulty, QuestionCategory category) {
    return getOpenQuestionsForConfig(difficulty, category).first;
  }

  QuestionInfo getQuestionInfo(Question question) {
    return getAllQuestionsForConfig(question.difficulty, question.category)
        .where((element) => element.question.index == question.index)
        .first;
  }

  Iterable<QuestionInfo> getOpenQuestionsForConfig(
      QuestionDifficulty difficulty, QuestionCategory category) {
    return _allQuestionInfos.where((element) =>
        element.status == QuestionInfoStatus.OPEN &&
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
    return _allQuestionInfos
        .where((e) => questionInfoStatus.contains(e.status))
        .length;
  }

  bool addAnswerToQuestionInfo(Question question, String answerId) {
    QuestionInfo questionInfo = getQuestionInfo(question);
    questionInfo.addAnswer(answerId);
    setQuestionFinishedStatus(questionInfo);
    return questionInfo.status == QuestionInfoStatus.WON;
  }

  void setQuestionFinishedStatus(QuestionInfo gameQuestionInfo) {
    QuestionService questionService =
        gameQuestionInfo.question.getQuestionService();
    bool userSuccess = questionService.isGameFinishedSuccessful(
        gameQuestionInfo.question, gameQuestionInfo.answers);
    if (userSuccess) {
      setWonQuestion(gameQuestionInfo);
    } else {
      bool userFail = questionService.isGameFinishedFailed(
          gameQuestionInfo.question, gameQuestionInfo.answers);
      if (userFail) {
        setLostQuestion(gameQuestionInfo);
      }
    }
  }

  void addQuestionInfoToList(QuestionInfo gameQuestionInfo) {
    _allQuestionInfos.add(gameQuestionInfo);
    _openQuestionInfos.add(gameQuestionInfo);
  }
}
