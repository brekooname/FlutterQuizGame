import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

mixin GameScreenManagerState<TGameContext extends GameContext> {
  @protected
  StandardScreen createMainScreen();

  @protected
  void setCurrentScreenState(StandardScreen statefulWidget);

  bool goBack(StandardScreen standardScreen);

  void showMainScreen() {
    setCurrentScreenState(createMainScreen());
  }

  void showNewGameScreen(CampaignLevel campaignLevel) {
    setCurrentScreenState(createNewGameScreen(campaignLevel));
  }

  void showNextGameScreen(
      CampaignLevel campaignLevel, TGameContext gameContext) {
    setCurrentScreenState(createNextGameScreen(campaignLevel, gameContext));
  }

  @protected
  StandardScreen createNewGameScreen(CampaignLevel campaignLevel) {
    TGameContext gameContext = createGameContext(campaignLevel);
    return getScreen(campaignLevel, gameContext);
  }

  @protected
  StandardScreen createNextGameScreen(
      CampaignLevel campaignLevel, TGameContext gameContext) {
    return getScreen(campaignLevel, gameContext);
  }

  @protected
  TGameContext createGameContext(CampaignLevel campaignLevel);

  @protected
  StandardScreen getScreenForConfig(TGameContext gameContext,
      QuestionDifficulty difficulty, QuestionCategory category);

  @protected
  Widget showScreen(StandardScreen? currentScreen) {
    return currentScreen != null
        ? AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child: currentScreen,
          )
        : Container();
  }

  StandardScreen getScreen(
      CampaignLevel campaignLevel, TGameContext gameContext) {
    var randomQuestionCategory =
        gameContext.gameUser.getNotPlayedRandomQuestionCategory();
    if (randomQuestionCategory == null) {
      return createMainScreen();
    } else {
      return getScreenForConfig(
          gameContext, campaignLevel.difficulty, randomQuestionCategory);
    }
  }
}
