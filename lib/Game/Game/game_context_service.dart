import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';

import 'game_context.dart';
import 'game_user.dart';

class GameContextService {
  static final GameContextService singleton = GameContextService.internal();

  factory GameContextService() {
    return singleton;
  }

  GameContextService.internal();

  GameContext createGameContextWithQuestions(List<Question> questions) {
    return createGameContextWithHintsAndQuestions(0, questions);
  }

  GameContext createGameContextWithHintsAndQuestions(
      int amountAvailableHints, List<Question> questions) {
    GameUser gameUser = _createGameUser(questions);
    Set<QuestionCategory> categs = {};
    Set<QuestionDifficulty> diff = {};
    for (Question question in questions) {
      categs.add(question.category);
      diff.add(question.difficulty);
    }
    QuestionConfig questionConfig =
        QuestionConfig(diff, categs, questions.length, amountAvailableHints);
    return _createGameContextWithUserAndQuestionConfig(gameUser, questionConfig);
  }

  GameContext _createGameContextWithUserAndQuestionConfig(
      GameUser gameUser, QuestionConfig questionConfig) {
    return GameContext(gameUser, questionConfig);
  }

  GameUser _createGameUser(List<Question> questions) {
    GameUser gameUser = GameUser();
    for (Question question in questions) {
      _addNewQuestionInfo(gameUser, question);
    }
    return gameUser;
  }

  void _addNewQuestionInfo(GameUser gameUser, Question question) {
    QuestionInfo gameQuestionInfo = QuestionInfo(question);
    gameUser.addQuestionInfoToList(gameQuestionInfo);
    question.questionService
        .processNewQuestionInfo(gameUser, gameQuestionInfo);
  }
}
