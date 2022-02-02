import 'package:flutter_app_quiz_game/Game/GameType/game_question_config.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import '../../main.dart';
import 'Model/category_difficulty.dart';
import 'all_questions_service.dart';

abstract class QuestionCollectorService<
    TAllQuestionsService extends AllQuestionsService,
    TGameQuestionConfig extends GameQuestionConfig> {
  late TAllQuestionsService allQuestionsService;
  late TGameQuestionConfig gameQuestionConfig;

  QuestionCollectorService() {
    allQuestionsService =
        MyApp.appId.gameConfig.allQuestionsService as TAllQuestionsService;
    gameQuestionConfig =
        MyApp.appId.gameConfig.gameQuestionConfig as TGameQuestionConfig;
  }

  Map<CategoryDifficulty, List<Question>> get allQuestions =>
      allQuestionsService.allQuestions;

  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> questions = [];
    for (QuestionCategory category
        in categories ?? gameQuestionConfig.categories) {
      for (QuestionDifficulty difficultyLevel
          in difficulties ?? gameQuestionConfig.difficulties) {
        questions.addAll(allQuestions
            .getOrDefault<CategoryDifficulty, List<Question>>(
                CategoryDifficulty(category, difficultyLevel), []));
      }
    }
    return questions;
  }
}
