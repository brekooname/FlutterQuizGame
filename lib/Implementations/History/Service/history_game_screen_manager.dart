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

import 'history_gamecontext_service.dart';

class HistoryGameScreenManager {
  late BuildContext buildContext;
  static final HistoryGameScreenManager singleton =
      HistoryGameScreenManager.internal();

  factory HistoryGameScreenManager({required BuildContext buildContext}) {
    singleton.buildContext = buildContext;
    return singleton;
  }

  HistoryGameScreenManager.internal();

  void showMainScreen() {}

  void showScreen(CampaignLevel campaignLevel) {
    NavigatorService().goTo(buildContext, getScreen(campaignLevel), () {});
  }

  StatefulWidget getScreen(CampaignLevel campaignLevel) {
    var gameContext =
        HistoryGameContextService().createGameContext(campaignLevel);
    return _getScreenForConfig(
        gameContext,
        campaignLevel.difficulty,
        _getNotPlayedRandomQuestionCategory(
            List.of(gameContext.gameUser.getAllQuestions([]))));
  }

  StatefulWidget _getScreenForConfig(GameContext gameContext,
      QuestionDifficulty difficulty, QuestionCategory category) {
    StatefulWidget goToScreen;
    var questionConfig = HistoryGameQuestionConfig();

    //
    category = questionConfig.cat1;
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

  QuestionCategory _getNotPlayedRandomQuestionCategory(
      List<QuestionInfo> allQuestions) {
    List<QuestionCategory> availableCategories = List.of(allQuestions
        .where((element) => element.status == QuestionInfoStatus.OPEN)
        .map((e) => e.question.category)
        .toSet());

    if (availableCategories.isEmpty) {
      //GAME OVER
      return availableCategories.first;
    } else if (availableCategories.length == 1) {
      return availableCategories.first;
    } else {
      var playedQuestions = allQuestions
          .where((element) =>
              [QuestionInfoStatus.WON, QuestionInfoStatus.LOST]
                  .contains(element.status) &&
              element.questionAnsweredAt != null)
          .toList();

      if (playedQuestions.isEmpty) {
        allQuestions.shuffle();
        return allQuestions.first.question.category;
      } else {
        playedQuestions.sort(
            (a, b) => a.questionAnsweredAt!.compareTo(b.questionAnsweredAt!));

        var mostRecentPlayedCategory = playedQuestions.first.question.category;

        availableCategories.remove(mostRecentPlayedCategory);
        availableCategories.shuffle();

        return availableCategories.first;
      }
    }
  }
}
