import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';

class SkelQuestionCollectorService extends QuestionCollectorService {
  static final SkelQuestionCollectorService singleton =
      SkelQuestionCollectorService.internal();

  factory SkelQuestionCollectorService() {
    return singleton;
  }

  SkelQuestionCollectorService.internal();
}
