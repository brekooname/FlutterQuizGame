import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/question_collector_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_all_questions.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
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
        .where((q) => !wonQuestions.contains(historyLocalStorage
            .getQuestionStorageKey(q.category, q.difficulty, q.index)))
        .toList();
    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            calculateNrOfHints(questions.length, campaignLevel), questions);
    var historyGameContext = HistoryGameContext(
        gameContext,
        HistoryAllQuestions()
            .getAllQuestionsForDifficulty(campaignLevel.difficulty)
            .length);
    historyGameContext.shownImagesForTimeLineHints =
        getShownImagesForTimeline(questions);
    return historyGameContext;
  }

  Map<QuestionCategory, List<int>> getShownImagesForTimeline(
      List<Question> questions) {
    Map<QuestionCategory, List<int>> res = HashMap();

    for (Question q in questions) {
      if (historyLocalStorage.isTimelineImageShown(q)) {
        if (res.containsKey(q.category)) {
          res.get<QuestionCategory, List<int>>(q.category)!.add(q.index);
        } else {
          res.putIfAbsent(q.category, () => [q.index]);
        }
      }
    }

    return res;
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
