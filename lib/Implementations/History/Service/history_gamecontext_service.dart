import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/main.dart';

class HistoryGameContextService {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();
  final QuestionCollectorService _questionCollectorService =
      QuestionCollectorService();

  static final HistoryGameContextService singleton =
      HistoryGameContextService.internal();

  factory HistoryGameContextService() {
    return singleton;
  }

  HistoryGameContextService.internal();

  HistoryGameContext createGameContext(CampaignLevel campaignLevel) {
    List<String> wonQuestions =
        historyLocalStorage.getWonQuestions(campaignLevel.difficulty);
    var questions = _questionCollectorService
        .getAllQuestionsForCategoriesAndDifficulties(
          [campaignLevel.difficulty],
          campaignLevel.category,
        )
        .where((element) => !wonQuestions
            .contains(historyLocalStorage.getQuestionStorageKey(element)))
        .toList();
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            calculateNrOfHints(questions.length, campaignLevel), questions);
    return HistoryGameContext(
        gameContext,
        HistoryAllQuestions()
            .getAllQuestionsForDifficulty(campaignLevel.difficulty)
            .length);
  }

  int calculateNrOfHints(int totalNrOfQuestions, CampaignLevel campaignLevel) {
    int currentHints =
        historyLocalStorage.getRemainingHints(campaignLevel.difficulty);
    if (currentHints == -1) {
      historyLocalStorage.setRemainingHints(campaignLevel.difficulty,
          (totalNrOfQuestions / (MyApp.isPro ? 4 : 10)).round());
    }
    return historyLocalStorage.getRemainingHints(campaignLevel.difficulty);
  }
}
