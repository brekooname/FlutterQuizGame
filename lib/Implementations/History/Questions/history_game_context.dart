import 'dart:collection';

import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';

class HistoryGameContext extends GameContext {
  int totalNrOfQuestionsForCampaignLevel;
  Map<QuestionCategory, List<int>> shownImagesForTimeLineHints = HashMap();

  HistoryGameContext(GameContext gameContext, this.totalNrOfQuestionsForCampaignLevel)
      : super(gameContext.gameUser, gameContext.questionConfig);
}
