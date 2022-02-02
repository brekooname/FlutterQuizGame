import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/AllContent/perstest_all_questions.dart';

class PersTestQuestionCollectorService extends QuestionCollectorService<
    PersTestAllQuestions, PersTestGameQuestionConfig> {

  static final PersTestQuestionCollectorService singleton =
      PersTestQuestionCollectorService.internal();

  factory PersTestQuestionCollectorService() {
    return singleton;
  }

  PersTestQuestionCollectorService.internal();

  @override
  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> result = [];
    for (QuestionDifficulty diff
        in difficulties ?? gameQuestionConfig.difficulties) {
      for (QuestionCategory cat
          in categories ?? gameQuestionConfig.categories) {
        if (cat == gameQuestionConfig.cat0 || cat == gameQuestionConfig.cat2) {
          result.addAll(
              super.getAllQuestions(categories: [cat], difficulties: [diff]));
        } else if (cat == gameQuestionConfig.cat1) {
          result.addAll(_createColorTestQuestions(cat, diff));
        }
      }
    }
    return result;
  }

  List<Question> _createColorTestQuestions(
      QuestionCategory category, QuestionDifficulty difficulty) {
    return [
      Question(0, difficulty, category, e.rawString),
      Question(1, difficulty, category, e.rawString)
    ];
  }
}
