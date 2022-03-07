import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Constants/anatomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/AllContent/anatomy_all_questions.dart';

class AnatomyQuestionCollectorService
    extends QuestionCollectorService<AnatomyAllQuestions, AnatomyGameQuestionConfig> {
  static final AnatomyQuestionCollectorService singleton =
      AnatomyQuestionCollectorService.internal();

  factory AnatomyQuestionCollectorService() {
    return singleton;
  }

  AnatomyQuestionCollectorService.internal();
}
