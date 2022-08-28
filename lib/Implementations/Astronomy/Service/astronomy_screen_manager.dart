import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Screens/astronomy_levels_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Screens/astronomy_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Screens/astronomy_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Screens/astronomy_solar_system_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

import '../Constants/astronomy_campaign_level_service.dart';

class AstronomyScreenManager extends GameScreenManager {
  final AstronomyCampaignLevelService _campaignLevelService =
      AstronomyCampaignLevelService();

  AstronomyScreenManager({Key? key}) : super(key: key);

  @override
  State<AstronomyScreenManager> createState() => AstronomyScreenManagerState();
}

class AstronomyScreenManagerState extends State<AstronomyScreenManager>
    with GameScreenManagerState<AstronomyGameContext> {
  @override
  void initState() {
    super.initState();
    RatePopupService ratePopupService = RatePopupService(buildContext: context);
    ratePopupService.showRateAppPopup();

    showMainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return createScreen(widget.currentScreen);
  }

  @override
  void showNextGameScreen(
      CampaignLevel campaignLevel, AstronomyGameContext gameContext) {
    super.showNextGameScreen(campaignLevel, gameContext);
  }

  void showLevelsScreen(AstronomyGameType astronomyGameType) {
    setCurrentScreenState(_createAstronomyLevelsScreen(astronomyGameType));
  }

  AstronomyLevelsScreen _createAstronomyLevelsScreen(
      AstronomyGameType astronomyGameType) {
    return AstronomyLevelsScreen(
      this,
      key: UniqueKey(),
      gameType: astronomyGameType,
    );
  }

  @override
  StandardScreen getScreenAfterGameOver(GameContext gameContext) {
    var gameTypeForCategory = widget._campaignLevelService
        .findGameTypeForCategory(gameContext.questionConfig.categories.first);
    if (gameTypeForCategory.gameTypeCampaignLevels.length == 1) {
      return createMainScreen();
    } else {
      return _createAstronomyLevelsScreen(gameTypeForCategory);
    }
  }

  @override
  bool goBack(StandardScreen standardScreen) {
    if (standardScreen.runtimeType == AstronomyMainMenuScreen) {
      return true;
    } else if (standardScreen.runtimeType == AstronomyQuestionScreen) {
      var questionScreen = (standardScreen as AstronomyQuestionScreen);
      var gameTypeForCategory = widget._campaignLevelService
          .findGameTypeForCategory(questionScreen.category);
      if (gameTypeForCategory.gameTypeCampaignLevels.length == 1) {
        showMainScreen();
      } else {
        showLevelsScreen(gameTypeForCategory);
      }
      return false;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return AstronomyMainMenuScreen(
      this,
      key: UniqueKey(),
    );
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
    AstronomyGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    AstronomyGameQuestionConfig questionConfig = AstronomyGameQuestionConfig();
    if (category == questionConfig.cat0) {
      return AstronomySolarSystemScreen(this,
          key: UniqueKey(),
          gameContext: gameContext,
          category: category,
          difficulty: difficulty);
    } else {
      return AstronomyQuestionScreen(this,
          key: UniqueKey(),
          gameContext: gameContext,
          category: category,
          difficulty: difficulty);
    }
  }

  @override
  @protected
  AstronomyGameContext createGameContext(CampaignLevel campaignLevel) {
    return AstronomyGameContextService().createGameContext(campaignLevel);
  }
}
