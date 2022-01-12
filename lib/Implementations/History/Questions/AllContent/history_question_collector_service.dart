import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';

class HistoryQuestionCollectorService extends QuestionCollectorService {
  static final HistoryQuestionCollectorService singleton =
      HistoryQuestionCollectorService.internal();

  factory HistoryQuestionCollectorService() {
    return singleton;
  }

  HistoryQuestionCollectorService.internal();
}
