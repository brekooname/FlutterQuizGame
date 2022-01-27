import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';

class PersTestQuestionCollectorService extends QuestionCollectorService {
  static final PersTestQuestionCollectorService singleton =
      PersTestQuestionCollectorService.internal();

  factory PersTestQuestionCollectorService() {
    return singleton;
  }

  PersTestQuestionCollectorService.internal();
}
