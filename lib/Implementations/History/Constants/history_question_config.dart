import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/CategoryService/unqiue_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class HistoryGameQuestionConfig extends GameQuestionConfig {
  QuestionCategory cat0 = QuestionCategory(
      index: 0,
      name: "cat0",
      questionCategoryService: UniqueAnswersCategoryQuestionService());
  QuestionCategory cat1 = QuestionCategory(
      index: 1,
      name: "cat1",
      questionCategoryService: UniqueAnswersCategoryQuestionService());

  late QuestionDifficulty diff0;

  HistoryGameQuestionConfig() {
    diff0 =
        QuestionDifficulty(index: 0, name: "diff0", categories: [cat0, cat1]);
  }

  @override
  List<QuestionDifficulty> difficulties() {
    return [diff0];
  }

  @override
  List<QuestionCategory> categories() {
    return [cat0, cat1];
  }
}
