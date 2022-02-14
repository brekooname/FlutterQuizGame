import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Constants/dopewars_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/AllContent/dopewars_all_questions.dart';

class DopeWarsQuestionCollectorService
    extends QuestionCollectorService<DopeWarsAllQuestions, DopeWarsGameQuestionConfig> {
  static final DopeWarsQuestionCollectorService singleton =
      DopeWarsQuestionCollectorService.internal();

  factory DopeWarsQuestionCollectorService() {
    return singleton;
  }

  DopeWarsQuestionCollectorService.internal();
}
