import 'package:collection/src/iterable_extensions.dart';
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
    //
    //Diagram image click
    //
    if (difficulty == gameQuestionConfig.diff0) {
      var list = allQuestions.get<CategoryDifficulty, List<Question>>(
          CategoryDifficulty(category, gameQuestionConfig.diff0))!;
      result = list;
    }
    //
    //Main Trivia
    //
    else if (difficulty == gameQuestionConfig.diff1) {
      result = allQuestions
          .get<CategoryDifficulty, List<Question>>(
              CategoryDifficulty(category, gameQuestionConfig.diff1))!
          .map((e) => Question(e.index, e.difficulty, e.category,
              _processRawStringForDependentQuestion(e)))
          .toList();
    }
    //
    //Disease Trivia
    //
    else if (difficulty == gameQuestionConfig.diff2) {
    }
    //
    //Disease Symptoms
    //
    else if (difficulty == gameQuestionConfig.diff3) {
    }
    //
    //Main Image Trivia
    //
    else if (difficulty == gameQuestionConfig.diff4) {
      result = allQuestions
          .get<CategoryDifficulty, List<Question>>(
              CategoryDifficulty(category, gameQuestionConfig.diff0))!
          .map((e) => Question(e.index, gameQuestionConfig.diff4, e.category,
              _processRawStringForDependentQuestion(e)))
          .toList();
    }
    return result
        .map((e) => Question(e.index, difficulty, category, e.rawString))
        .toList();
  }

  String _processRawStringForDependentQuestion(Question question) {
    Question? questionOpt = getAllQuestions(
            difficulties: [gameQuestionConfig.diff0],
            categories: [question.category])
        .firstWhereOrNull((element) => element.index == question.index);
    if (questionOpt == null) {
      throw AssertionError(
          ["No diff 0 question found for cat " + question.category.name]);
    }

    var optString = question.rawString.split(":")[1];
    return question.rawString.split(":")[0] +
        ":" +
        questionOpt.rawString.split(":")[0] +
        ":" +
        optString.substring(optString.indexOf(",") + 1) +
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
