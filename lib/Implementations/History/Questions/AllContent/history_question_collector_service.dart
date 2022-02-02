import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_all_questions.dart';

class HistoryQuestionCollectorService extends QuestionCollectorService<
    HistoryAllQuestions, HistoryGameQuestionConfig> {
  static final HistoryQuestionCollectorService singleton =
      HistoryQuestionCollectorService.internal();

  factory HistoryQuestionCollectorService() {
    return singleton;
  }

  HistoryQuestionCollectorService.internal();
}
