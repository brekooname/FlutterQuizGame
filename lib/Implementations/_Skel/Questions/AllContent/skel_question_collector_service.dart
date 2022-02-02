import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Constants/skel_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Questions/AllContent/skel_all_questions.dart';

class SkelQuestionCollectorService
    extends QuestionCollectorService<SkelAllQuestions, SkelGameQuestionConfig> {
  static final SkelQuestionCollectorService singleton =
      SkelQuestionCollectorService.internal();

  factory SkelQuestionCollectorService() {
    return singleton;
  }

  SkelQuestionCollectorService.internal();
}
