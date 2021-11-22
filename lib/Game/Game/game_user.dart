import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info_status.dart';

class GameUser {
  List<QuestionInfo> openQuestionInfos = [];
  List<QuestionInfo> allQuestionInfos = [];
  int wonQuestions = 0;
  int lostQuestions = 0;

  void setWonQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.isQuestionOpen()) {
      gameQuestionInfo.status = QuestionInfoStatus.WON;
      wonQuestions++;
      openQuestionInfos.remove(gameQuestionInfo);
    }
  }

  void resetQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.status == QuestionInfoStatus.LOST) {
      lostQuestions = lostQuestions - 1;
    } else if (gameQuestionInfo.status == QuestionInfoStatus.WON) {
      wonQuestions = wonQuestions - 1;
    }
    gameQuestionInfo.status = QuestionInfoStatus.OPEN;
    if (!openQuestionInfos.contains(gameQuestionInfo)) {
      gameQuestionInfo.answers.clear();
      openQuestionInfos.add(gameQuestionInfo);
    }
  }

  void setLostQuestion(QuestionInfo gameQuestionInfo) {
    if (gameQuestionInfo.isQuestionOpen()) {
      gameQuestionInfo.status = QuestionInfoStatus.LOST;
      lostQuestions++;
      openQuestionInfos.remove(gameQuestionInfo);
    }
  }

  int getFinishedQuestions() {
    return wonQuestions + lostQuestions;
  }

  void addAnswerToQuestionInfo(QuestionInfo? gameQuestionInfo, String answerId) {
    if (gameQuestionInfo != null) {
      gameQuestionInfo.addAnswer(answerId);
      setQuestionFinishedStatus(gameQuestionInfo);
    }
  }

  void addAnswerToCurrentQuestionInfo(String answerId) {
    addAnswerToQuestionInfo(getQuestionInfo(), answerId);
  }

  void setQuestionFinishedStatus(QuestionInfo gameQuestionInfo) {
    GameService gameService = CreatorDependenciesContainer.getCreator(
            gameQuestionInfo
                .getQuestion()
                .getQuestionCategory()
                .getCreatorDependencies())
        .getGameService(gameQuestionInfo.getQuestion());
    bool userSuccess =
        gameService.isGameFinishedSuccessful(gameQuestionInfo.answers);
    if (userSuccess) {
      setWonQuestion(gameQuestionInfo);
    } else {
      bool userFail =
          gameService.isGameFinishedFailed(gameQuestionInfo.answers);
      if (userFail) {
        setLostQuestion(gameQuestionInfo);
      }
    }
  }

  QuestionInfo? getQuestionInfo() {
    return openQuestionInfos.isEmpty ? null : openQuestionInfos.first;
  }

  QuestionInfo getQuestionInfoForIndex(int questionIndex) {
    return allQuestionInfos.elementAt(questionIndex);
  }

  bool userHasMultipleQuestions() {
    return getTotalNrOfQuestions() > 1;
  }

  int getTotalNrOfQuestions() {
    return allQuestionInfos.length;
  }

  void addQuestionInfoToList(QuestionInfo gameQuestionInfo) {
    allQuestionInfos.add(gameQuestionInfo);
    openQuestionInfos.add(gameQuestionInfo);
  }
}
