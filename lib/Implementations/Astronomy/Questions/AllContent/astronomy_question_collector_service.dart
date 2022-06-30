import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/AllContent/astronomy_all_questions.dart';

class AstronomyQuestionCollectorService extends QuestionCollectorService<
    AstronomyAllQuestions, AstronomyGameQuestionConfig> {
  static final AstronomyQuestionCollectorService singleton =
      AstronomyQuestionCollectorService.internal();

  factory AstronomyQuestionCollectorService() {
    return singleton;
  }

  AstronomyQuestionCollectorService.internal();
}
