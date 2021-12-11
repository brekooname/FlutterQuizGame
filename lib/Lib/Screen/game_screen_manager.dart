import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';

abstract class GameScreenManager {
  late BuildContext buildContext;
  NavigatorService? _navigatorService;

  void showMainScreen();

  GameContext createGameContext(CampaignLevel campaignLevel);

  StatefulWidget getScreenForConfig(GameContext gameContext,
      QuestionDifficulty difficulty, QuestionCategory category);

  void showNewGameScreen(CampaignLevel campaignLevel) {
    GameContext gameContext = createGameContext(campaignLevel);
    navigatorService.goTo(getScreen(campaignLevel, gameContext), () {});
  }

  void showNextGameScreen(
      CampaignLevel campaignLevel, GameContext gameContext) {
    navigatorService.pop();
    navigatorService.goTo(getScreen(campaignLevel, gameContext), () {});
  }

  NavigatorService get navigatorService {
    _navigatorService ??= NavigatorService(buildContext);
    return _navigatorService!;
  }

  StatefulWidget getScreen(
      CampaignLevel campaignLevel, GameContext gameContext) {
    return getScreenForConfig(
        gameContext,
        campaignLevel.difficulty,
        _getNotPlayedRandomQuestionCategory(
            List.of(gameContext.gameUser.getAllQuestions([]))));
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
