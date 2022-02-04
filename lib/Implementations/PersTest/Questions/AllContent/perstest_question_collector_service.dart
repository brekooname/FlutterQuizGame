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

}
