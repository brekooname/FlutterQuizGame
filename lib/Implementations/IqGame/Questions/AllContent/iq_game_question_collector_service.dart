import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/AllContent/iq_game_all_questions.dart';

import '../../../../Game/Question/Model/question.dart';
import '../../../../Game/Question/Model/question_category.dart';
import '../../../../Game/Question/Model/question_difficulty.dart';

class IqGameQuestionCollectorService
    extends QuestionCollectorService<IqGameAllQuestions, IqGameQuestionConfig> {
  static const int iqTestTotalQuestions = 39;

  static final IqGameQuestionCollectorService singleton =
      IqGameQuestionCollectorService.internal();

  factory IqGameQuestionCollectorService() {
    return singleton;
  }

  IqGameQuestionCollectorService.internal();

  @override
  List<Question> getAllQuestions({
    List<QuestionDifficulty>? difficulties,
    List<QuestionCategory>? categories,
  }) {
    List<Question> result = [];
    int i = 0;
    for (QuestionDifficulty diff
        in difficulties ?? gameQuestionConfig.difficulties) {
      for (QuestionCategory cat
          in categories ?? gameQuestionConfig.categories) {
        if (diff == gameQuestionConfig.diff0) {
          if (cat == gameQuestionConfig.cat0) {
            for (int qNr = 0; qNr < iqTestTotalQuestions; qNr++) {
              result.add(Question(i, diff, cat, qNr.toString()));
              i++;
            }
          }
        }
      }
    }
    return result;
  }
}
