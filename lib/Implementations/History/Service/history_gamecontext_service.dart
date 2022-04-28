import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/AllContent/history_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';
import 'package:flutter_app_quiz_game/main.dart';

class HistoryGameContextService {
  HistoryLocalStorage historyLocalStorage = HistoryLocalStorage();

  static final HistoryGameContextService singleton =
      HistoryGameContextService.internal();

  factory HistoryGameContextService() {
    return singleton;
  }

  HistoryGameContextService.internal();

  HistoryGameContext createGameContext(CampaignLevel campaignLevel) {
    List<QuestionKey> wonQuestions =
        historyLocalStorage.getWonQuestionsForDiff(campaignLevel.difficulty);
    var questions =
        MyApp.appId.gameConfig.questionCollectorService.getAllQuestions(
      difficulties: [campaignLevel.difficulty],
      categories: campaignLevel.categories,
    ).where((q) {
      var questionKey = QuestionKey(q.category, q.difficulty, q.index);
      return !wonQuestions.contains(questionKey);
    }).toList();
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            _calculateNrOfHints(questions.length, campaignLevel), questions);
    var historyGameContext = HistoryGameContext(
        gameContext,
        HistoryAllQuestions()
            .getAllQuestionsForDifficulty(campaignLevel.difficulty)
            .length);
    return historyGameContext;
  }

  int _calculateNrOfHints(int totalNrOfQuestions, CampaignLevel campaignLevel) {
    int currentHints =
        historyLocalStorage.getRemainingHintsForDiff(campaignLevel.difficulty);
    if (currentHints == -1) {
      historyLocalStorage.setRemainingHintsForDiff(campaignLevel.difficulty,
          (totalNrOfQuestions / (MyApp.isExtraContentLocked ? 11 : 4)).ceil());
    }
    return historyLocalStorage.getRemainingHintsForDiff(campaignLevel.difficulty);
  }
}
