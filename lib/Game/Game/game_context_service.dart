import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/random_question_creator_service.dart';

import '../my_app_context.dart';
import 'game_context.dart';
import 'game_user.dart';

class GameContextService {
  late Map<CategoryDifficulty, List<Question>> allQuestionsWithConfig;

  late MyAppContext myAppContext;

  static final GameContextService singleton = GameContextService.internal();

  factory GameContextService(
      {required MyAppContext myAppContext,
      required Map<CategoryDifficulty, List<Question>>
          allQuestionsWithConfig}) {
    singleton.myAppContext = myAppContext;
    singleton.allQuestionsWithConfig = allQuestionsWithConfig;
    return singleton;
  }

  GameContextService.internal();

  GameContext createGameContextWithQuestions(List<Question> questions) {
    return createGameContextWithHintsAndQuestions(0, questions);
  }

  GameContext createGameContextWithHintsAndQuestions(
      int amountAvailableHints, List<Question> questions) {
    GameUser gameUser = createGameUser(questions);
    Set<QuestionCategory> categs = {};
    Set<QuestionDifficulty> diff = {};
    for (Question question in questions) {
      categs.add(question.category);
      diff.add(question.difficulty);
    }
    QuestionConfig questionConfig =
        QuestionConfig(diff, categs, questions.length, amountAvailableHints);
    return createGameContextWithUserAndQuestionConfig(gameUser, questionConfig);
  }

  GameContext createGameContextWithQuestionConfig(
      QuestionConfig questionConfig) {
    List<Question> randomQuestions =
        RandomQuestionCreatorService(myAppContext: myAppContext)
            .createRandomQuestions(allQuestionsWithConfig, questionConfig);
    GameUser gameUser = createGameUser(randomQuestions);
    return createGameContextWithUserAndQuestionConfig(gameUser, questionConfig);
  }

  GameContext createGameContextWithUserAndQuestionConfig(
      GameUser gameUser, QuestionConfig questionConfig) {
    return GameContext(gameUser, questionConfig);
  }

  GameUser createGameUser(List<Question> questions) {
    GameUser gameUser = GameUser();
    for (Question question in questions) {
      addNewQuestionInfo(gameUser, question);
    }
    return gameUser;
  }

  void addNewQuestionInfo(GameUser gameUser, Question question) {
    QuestionInfo gameQuestionInfo = QuestionInfo(question: question);
    gameUser.addQuestionInfoToList(gameQuestionInfo);
    question.category.questionCategoryService
        .getQuestionService()
        .processNewQuestionInfo(gameUser, gameQuestionInfo);
  }
}
