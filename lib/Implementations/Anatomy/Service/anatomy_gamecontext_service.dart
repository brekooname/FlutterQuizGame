import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/quiz_game_local_storage.dart';

import '../../../Game/Question/Model/question_category.dart';
import '../../../Game/Question/Model/question_difficulty.dart';
import '../../../main.dart';

class AnatomyGameContextService {
  final AnatomyLocalStorage _anatomyLocalStorage = AnatomyLocalStorage();

  static final AnatomyGameContextService singleton =
      AnatomyGameContextService.internal();

  factory AnatomyGameContextService() {
    return singleton;
  }

  AnatomyGameContextService.internal();

  AnatomyGameContext createGameContext(CampaignLevel campaignLevel) {
    var category = campaignLevel.categories.first;

    List<QuestionKey> wonQuestions = _anatomyLocalStorage
        .getWonQuestionsForDiffAndCat(campaignLevel.difficulty, category);

    var allQuestions = MyApp.appId.gameConfig.questionCollectorService
        .getAllQuestions(
            categories: [category], difficulties: [campaignLevel.difficulty]);

    var notWonQuestions = allQuestions.where((q) {
      return !wonQuestions
          .contains(QuestionKey(q.category, q.difficulty, q.index));
    }).toList();

    var gameContext = GameContextService()
        .createGameContextWithHintsAndQuestions(
            _getAmountAvailableHints(category, campaignLevel.difficulty),
            notWonQuestions.isEmpty ? allQuestions : notWonQuestions);
    var anatomyGameContext = AnatomyGameContext(gameContext);
    return anatomyGameContext;
  }

  int _getAmountAvailableHints(QuestionCategory cat, QuestionDifficulty diff) {
    int currentHints =
        _anatomyLocalStorage.getRemainingHintsForCatDiff(cat, diff);
    if (currentHints == -1) {
      _anatomyLocalStorage.setRemainingHintsForCatDiff(
          cat, diff, MyApp.isExtraContentLocked ? 3 : 8);
    }
    return _anatomyLocalStorage.getRemainingHintsForCatDiff(cat, diff);
  }
}
