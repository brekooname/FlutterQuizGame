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

  bool answerQuestion(QuestionInfo questionInfo, String answer) {
    skippedQuestions.remove(questionInfo);
    return gameUser.addAnswerToQuestionInfo(questionInfo.question, answer);
  }
}
