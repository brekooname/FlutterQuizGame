import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_game_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_game_timeline_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager.dart';

import 'history_gamecontext_service.dart';

class HistoryGameScreenManager extends GameScreenManager {
  static final HistoryGameScreenManager singleton =
  HistoryGameScreenManager.internal();

  factory HistoryGameScreenManager({required BuildContext buildContext}) {
    singleton.buildContext = buildContext;
    return singleton;
  }

  HistoryGameScreenManager.internal();

  @override
  void showMainScreen() {}

  @override
  StatefulWidget getScreenForConfig(
      GameContext gameContext,
      QuestionDifficulty difficulty,
      QuestionCategory category) {
    StatefulWidget goToScreen;
    var questionConfig = HistoryGameQuestionConfig();

    //
    category = questionConfig.cat2;
    //

    if ([questionConfig.cat0, questionConfig.cat1].contains(category)) {
      goToScreen = HistoryGameTimelineScreen(
        gameContext: gameContext,
        difficulty: difficulty,
        category: category,
      );
    } else {
      goToScreen = HistoryGameQuestionScreen(
        gameContext: gameContext,
        difficulty: difficulty,
        category: category,
      );
    }
    return goToScreen;
  }

  @override
  GameContext createGameContext(CampaignLevel campaignLevel) {
    return HistoryGameContextService().createGameContext(campaignLevel);
  }
}
