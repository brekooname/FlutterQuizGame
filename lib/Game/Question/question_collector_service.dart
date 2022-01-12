import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

import '../../main.dart';
import 'Model/category_difficulty.dart';
import 'all_questions_service.dart';

abstract class QuestionCollectorService<
    TAllQuestionsService extends AllQuestionsService> {
  late TAllQuestionsService allQuestionsService;

  QuestionCollectorService() {
    allQuestionsService =
        MyApp.appId.gameConfig.allQuestionsService as TAllQuestionsService;
  }

  List<Question> getAllQuestionsForCategory(QuestionCategory questionCategory) {
    var difficulties =
        allQuestions.entries.map((e) => e.key.difficulty).toList();
    return getAllQuestionsForCategoriesAndDifficulties(
      difficulties,
      [questionCategory],
    );
  }

  Map<CategoryDifficulty, List<Question>> get allQuestions =>
      allQuestionsService.allQuestions;

  List<Question> getAllQuestionsForCategoriesAndDifficulties(
    List<QuestionDifficulty> difficultyLevels,
    List<QuestionCategory> categories,
  ) {
    List<Question> questions = [];
    for (QuestionCategory category in categories) {
      for (QuestionDifficulty difficultyLevel in difficultyLevels) {
        questions.addAll(allQuestions
            .getOrDefault<CategoryDifficulty, List<Question>>(
                CategoryDifficulty(category, difficultyLevel), []));
      }
    }
    return questions;
  }
}
