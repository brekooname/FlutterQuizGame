import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';

import '../../../Game/Question/Model/question_info.dart';

class IqGameContext extends GameContext {
  List<QuestionInfo> skippedQuestions = [];

  IqGameContext(GameContext gameContext)
      : super(gameContext.gameUser, gameContext.questionConfig);

  void skipQuestion(QuestionInfo questionInfo) {
    skippedQuestions.remove(questionInfo);
    skippedQuestions.add(questionInfo);
  }

  void answerQuestion(QuestionInfo questionInfo, String answer) {
    gameUser.addAnswerToQuestionInfo(questionInfo.question, answer);
    skippedQuestions.remove(questionInfo);
  }
}
