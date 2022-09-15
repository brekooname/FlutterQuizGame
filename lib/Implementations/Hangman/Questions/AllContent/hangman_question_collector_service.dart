import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Constants/hangman_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/AllContent/hangman_all_questions.dart';

class HangmanQuestionCollectorService
    extends QuestionCollectorService<HangmanAllQuestions, HangmanGameQuestionConfig> {
  static final HangmanQuestionCollectorService singleton =
      HangmanQuestionCollectorService.internal();

  factory HangmanQuestionCollectorService() {
    return singleton;
  }

  HangmanQuestionCollectorService.internal();
}
