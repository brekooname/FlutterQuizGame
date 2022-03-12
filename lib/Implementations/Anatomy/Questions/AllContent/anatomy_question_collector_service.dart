import 'package:flutter_app_quiz_game/Game/Question/Model/category_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/AllContent/anatomy_all_questions.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';

class AnatomyQuestionCollectorService extends QuestionCollectorService<
    AnatomyAllQuestions, AnatomyGameQuestionConfig> {
  static final AnatomyQuestionCollectorService singleton =
      AnatomyQuestionCollectorService.internal();

  factory AnatomyQuestionCollectorService() {
    return singleton;
  }

  AnatomyQuestionCollectorService.internal();

  List<Question> getAllQuestionsForCategoryAndDifficulty(
      QuestionCategory category, QuestionDifficulty difficulty) {
    List<Question> result = [];
    if (difficulty == gameQuestionConfig.diff0) {
      var list = allQuestions.get<CategoryDifficulty, List<Question>>(
          CategoryDifficulty(category, gameQuestionConfig.diff0))!;
      result = list;
    } else if (difficulty == gameQuestionConfig.diff1) {
      var list = allQuestions.get<CategoryDifficulty, List<Question>>(
          CategoryDifficulty(category, gameQuestionConfig.diff1))!;
      result = list
          .map((e) => Question(e.index, e.difficulty, e.category,
              _processRawStringForDependentQuestion(e.rawString)))
          .toList();
    }
    return result
        .map((e) => Question(e.index, difficulty, category, e.rawString))
        .toList();
  }

  String _processRawStringForDependentQuestion(String qString) {
    return qString.split(":")[0] +
        ":" +
TODO should form the raw string for dependent ..................      qString.split(":")[1].split(",")[0] +
        ":" +
        qString.split(":")[1] +
        ":";
  }

  @override
  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> result = [];
    for (QuestionDifficulty diff
        in difficulties ?? gameQuestionConfig.difficulties) {
      for (QuestionCategory questionCategory
          in categories ?? gameQuestionConfig.categories) {
        result.addAll(
            getAllQuestionsForCategoryAndDifficulty(questionCategory, diff));
      }
    }
    return result;
  }
}
