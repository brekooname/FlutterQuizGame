import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Screens/geoquiz_game_hangman_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Screens/geoquiz_game_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Screens/geoquiz_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

import 'geoquiz_gamecontext_service.dart';

class GeoQuizGameScreenManager extends GameScreenManager {
  GeoQuizGameContextService _geoQuizGameContextService =
      GeoQuizGameContextService();

  @override
  State<GeoQuizGameScreenManager> createState() =>
      GeoQuizGameScreenManagerState();
}

class GeoQuizGameScreenManagerState extends State<GeoQuizGameScreenManager>
    with GameScreenManagerState<GeoQuizGameContext> {
  @override
  void initState() {
    super.initState();
    RatePopupService ratePopupService = RatePopupService(buildContext: context);
    ratePopupService.showRateAppPopup();

    showMainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return showScreen(widget.currentScreen);
  }

  @override
  bool goBack(StandardScreen standardScreen) {
    if (standardScreen.runtimeType == GeoQuizMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  void showNextGameScreen(
      CampaignLevel campaignLevel, GeoQuizGameContext gameContext) {
    widget._geoQuizGameContextService
        .removeStatsQuestionsIfAlreadyPlayed(gameContext, campaignLevel);
    super.showNextGameScreen(campaignLevel, gameContext);
  }

  @override
  StandardScreen createMainScreen() {
    return GeoQuizMainMenuScreen(this);
  }

  @override
  void setCurrentScreenState(StandardScreen statefulWidget) {
    setState(() {
      widget.currentScreen = statefulWidget;
    });
  }

  @override
  @protected
  StandardScreen getScreenForConfig(
    GeoQuizGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    StandardScreen goToScreen;
    var questionConfig = GeoQuizGameQuestionConfig();
    //
    ////
    category = questionConfig.cat0;
    ////
    //

    if ([questionConfig.cat0].contains(category)) {
      goToScreen = GeoQuizHangmanScreen(
        this,
        key: UniqueKey(),
        gameContext: gameContext,
        difficulty: difficulty,
        category: category,
      );
    } else {
      goToScreen = GeoQuizQuestionScreen(
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
  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    return GeoQuizGameContextService().createGameContext(campaignLevel);
  }
}
