import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Lib/Navigation/navigator_service.dart';

abstract class GameScreenManager<TGameContext extends GameContext> {
  late BuildContext buildContext;
  NavigatorService? _navigatorService;

  StatefulWidget getMainScreen();

  TGameContext createGameContext(CampaignLevel campaignLevel);

  StatefulWidget getScreenForConfig(TGameContext gameContext,
      QuestionDifficulty difficulty, QuestionCategory category);

  void showNewGameScreen(CampaignLevel campaignLevel, VoidCallback setStateForRefresh) {
    TGameContext gameContext = createGameContext(campaignLevel);
    navigatorService.goTo(
        buildContext, getScreen(campaignLevel, gameContext), setStateForRefresh);
  }

  void showNextGameScreen(
      CampaignLevel campaignLevel, TGameContext gameContext) {
    print("go next");

    navigatorService.pop(buildContext);
    navigatorService.goTo(
        buildContext, getScreen(campaignLevel, gameContext), () {});
  }

  NavigatorService get navigatorService {
    _navigatorService ??= NavigatorService();
    return _navigatorService!;
  }

  StatefulWidget getScreen(
      CampaignLevel campaignLevel, TGameContext gameContext) {
    return getScreenForConfig(gameContext, campaignLevel.difficulty,
        _getNotPlayedRandomQuestionCategory(gameContext));
  }

  QuestionCategory _getNotPlayedRandomQuestionCategory(
      TGameContext gameContext) {
    var allQuestions = gameContext.gameUser.getAllQuestions([]);
    allQuestions
        .where((element) => element.status == QuestionInfoStatus.OPEN)
        .length
        .toString();
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
      QuestionInfo? mostRecentQuestion = gameContext.gameUser
          .getMostRecentAnsweredQuestion(questionInfoStatus: [
        QuestionInfoStatus.WON,
        QuestionInfoStatus.LOST
      ]);

      if (mostRecentQuestion == null) {
        allQuestions.shuffle();
        return allQuestions.first.question.category;
      } else {
        availableCategories.remove(mostRecentQuestion.question.category);
        availableCategories.shuffle();

        return availableCategories.first;
      }
    }
  }
}
