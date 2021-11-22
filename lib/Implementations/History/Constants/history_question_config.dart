import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class HistoryGameQuestionConfig extends GameQuestionConfig {
  QuestionCategory cat0 = QuestionCategory(0, "cat0", );
  QuestionCategory cat1 = QuestionCategory(1, "cat1");

  late QuestionDifficulty diff0;

  HistoryGameQuestionConfig() {
    diff0 = QuestionDifficulty(0, "diff0", [cat0, cat1]);
  }

  @override
  List<QuestionDifficulty> difficulties() {
    return [diff0];
  }

  @override
  List<QuestionCategory> categories() {
    throw [cat0, cat1];
  }
}
