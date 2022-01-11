import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_game_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_game_timeline_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Screens/history_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

import 'history_gamecontext_service.dart';

class HistoryGameScreenManager extends GameScreenManager {
  HistoryGameScreenManager({Key? key}) : super(key: key);

  @override
  State<HistoryGameScreenManager> createState() =>
      HistoryGameScreenManagerState();
}

class HistoryGameScreenManagerState extends State<HistoryGameScreenManager>
    with GameScreenManagerState<HistoryGameContext> {
  @override
  void initState() {
    super.initState();
    RatePopupService ratePopupService = RatePopupService(buildContext: context);
    ratePopupService.showRateAppPopup();

    showMainScreen();
  }

  @override
  void showNextGameScreen(
      CampaignLevel campaignLevel, HistoryGameContext gameContext) {
    gameContext.gameUser
        .getAllQuestions([QuestionInfoStatus.lost]).forEach((element) {
      gameContext.gameUser.resetQuestion(element);
    });
    super.showNextGameScreen(campaignLevel, gameContext);
  }

  @override
  Widget build(BuildContext context) {
    return showScreen(widget.currentScreen);
  }

  @override
  bool goBack(StandardScreen standardScreen) {
    if (standardScreen.runtimeType == HistoryMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return HistoryMainMenuScreen(this);
  }

  @override
  void setCurrentScreenState(StandardScreen statefulWidget) {
    setState(() {
      widget.currentScreen = statefulWidget;
    });
  }

  @override
  @protected
  GameScreen getScreenForConfig(
    HistoryGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    GameScreen goToScreen;
    var questionConfig = HistoryGameQuestionConfig();
    //
    ////
    // category = questionConfig.cat1;
    ////
    //
    if ([questionConfig.cat0, questionConfig.cat1].contains(category)) {
      goToScreen = HistoryGameTimelineScreen(
        this,
        key: UniqueKey(),
        gameContext: gameContext,
        difficulty: difficulty,
        category: category,
      );
    } else {
      goToScreen = HistoryGameQuestionScreen(
        this,
        key: UniqueKey(),
        gameContext: gameContext,
        difficulty: difficulty,
        category: category,
      );
    }
    return goToScreen;
  }

  @override
  @protected
  HistoryGameContext createGameContext(CampaignLevel campaignLevel) {
    return HistoryGameContextService().createGameContext(campaignLevel);
  }

}
