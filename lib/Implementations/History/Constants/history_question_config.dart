import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/CategoryService/unqiue_answers_question_category_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_difficulty.dart';

class HistoryGameQuestionConfig extends GameQuestionConfig {
  late QuestionCategory cat0;

  late QuestionCategory cat1;

  late QuestionDifficulty diff0;

  static final HistoryGameQuestionConfig singleton =
      HistoryGameQuestionConfig.internal();

  factory HistoryGameQuestionConfig() {
    singleton.cat0 = QuestionCategory(
        index: 0,
        name: "cat0",
        questionCategoryService: UniqueAnswersCategoryQuestionService());
    singleton.cat1 = QuestionCategory(
        index: 1,
        name: "cat1",
        questionCategoryService: UniqueAnswersCategoryQuestionService());
    singleton.diff0 = QuestionDifficulty(
        index: 0, name: "diff0", categories: [singleton.cat0, singleton.cat1]);
    return singleton;
  }

  HistoryGameQuestionConfig.internal();

  @override
  List<QuestionDifficulty> difficulties() {
    return [diff0];
  }

  @override
  List<QuestionCategory> categories() {
    return [cat0, cat1];
  }
}
