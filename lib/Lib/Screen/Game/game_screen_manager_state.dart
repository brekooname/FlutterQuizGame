import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

import '../../../main.dart';
import '../../ScreenDimensions/screen_dimensions_service.dart';
import 'game_screen.dart';

mixin GameScreenManagerState<TGameContext extends GameContext> {
  @protected
  StandardScreen createMainScreen();

  @protected
  void setCurrentScreenState(StandardScreen statefulWidget);

  @protected
  TGameContext createGameContext(CampaignLevel campaignLevel);

  @protected
  GameScreen getScreenForConfig(TGameContext gameContext,
      QuestionDifficulty difficulty, QuestionCategory category);

  bool goBack(StandardScreen standardScreen);

  void showMainScreen() {
    setCurrentScreenState(createMainScreen());
  }

  void showNewGameScreen(CampaignLevel campaignLevel) {
    TGameContext gameContext = createGameContext(campaignLevel);
    var notPlayedRandomQuestionCategory =
        gameContext.gameUser.getNotPlayedRandomQuestionCategory();
    showGameScreenWithConfig(
        campaignLevel.difficulty, notPlayedRandomQuestionCategory, gameContext);
  }

  void showNextGameScreen(
      CampaignLevel campaignLevel, TGameContext gameContext) {
    showGameScreenWithConfig(campaignLevel.difficulty,
        gameContext.gameUser.getNotPlayedRandomQuestionCategory(), gameContext);
  }

  void showGameScreenWithConfig(QuestionDifficulty difficulty,
      QuestionCategory? category, TGameContext gameContext) {
    setCurrentScreenState(_getScreen(difficulty, category, gameContext));
  }

  @protected
  Widget createScreen(StandardScreen? currentScreen) {
    if (currentScreen == null) {
      return Container();
    }
    var currentScreenExpanded = Expanded(
        child: SafeArea(
            child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(child: child, opacity: animation);
      },
      child: currentScreen,
    )));
    var boxDecoration = BoxDecoration(
        image: DecorationImage(
      repeat: MyApp.appId.gameConfig.backgroundTextureRepeat,
      image: MyApp.backgroundTexture.image,
    ));
    var screenContainerWithDecoration = Container(
      decoration: boxDecoration,
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: ScreenDimensionsService.isPortrait() ? 9 / 16 : 16 / 9,
        child: Container(
          ////
          //
          ////
          //
          ////
          // color: Colors.blue,
          ////
          //
          ////
          //
          ////
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[MyApp.bannerAdContainer, currentScreenExpanded],
          ),
        ),
      ),
    );
    return Container(
      color: currentScreen.screenBackgroundColor ??
          MyApp.appId.gameConfig.defaultScreenBackgroundColor,
      child: screenContainerWithDecoration,
    );
  }

  StandardScreen getScreenAfterGameOver(TGameContext gameContext) {
    return createMainScreen();
  }

  StandardScreen _getScreen(QuestionDifficulty difficulty,
      QuestionCategory? category, TGameContext gameContext) {
    debugPrint("get screen for config " +
        difficulty.name +
        " " +
        (category?.name ?? "no category"));
    if (category == null) {
      return getScreenAfterGameOver(gameContext);
    } else {
      return getScreenForConfig(gameContext, difficulty, category);
    }
  }
}
