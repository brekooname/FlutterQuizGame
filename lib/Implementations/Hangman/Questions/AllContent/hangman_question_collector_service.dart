import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/AllContent/hangman_all_questions.dart';

import '../../../../Game/Question/Model/question.dart';
import '../../../../Game/Question/Model/question_category.dart';
import '../../../../Game/Question/Model/question_difficulty.dart';

class HangmanQuestionCollectorService extends QuestionCollectorService<
    HangmanAllQuestions, HangmanGameQuestionConfig> {
  static final HangmanQuestionCollectorService singleton =
      HangmanQuestionCollectorService.internal();

  factory HangmanQuestionCollectorService() {
    return singleton;
  }

  HangmanQuestionCollectorService.internal();

  @override
  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> result = [];
    for (QuestionCategory questionCategory in categories ?? []) {
      if (gameQuestionConfig.isMixedCategory(questionCategory)) {
        result.addAll(_getMixCategoryQuestions(difficulties ?? []));
      } else {
        result.addAll(super.getAllQuestions(
            difficulties: difficulties, categories: [questionCategory]));
      }
    }
    return result;
  }

  List<Question> _getMixCategoryQuestions(
      List<QuestionDifficulty> difficulties) {
    List<Question> result = [];
    List<QuestionCategory> categsWithoutMix =
        gameQuestionConfig.getAllCategoriesWithoutMixCategory();
    for (QuestionDifficulty diff in difficulties) {
      for (QuestionCategory cat in categsWithoutMix) {
        result.addAll(
            super.getAllQuestions(difficulties: [diff], categories: [cat]));
      }
    }
    return result;
  }
}
