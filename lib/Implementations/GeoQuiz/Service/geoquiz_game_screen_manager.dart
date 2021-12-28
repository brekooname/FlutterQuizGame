import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context_service.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Screens/geoquiz_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class GeoQuizGameScreenManager extends GameScreenManager {
  @override
  State<GeoQuizGameScreenManager> createState() =>
      GeoQuizGameScreenManagerState();
}

class GeoQuizGameScreenManagerState extends State<GeoQuizGameScreenManager>
    with GameScreenManagerState<GameContext> {
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
    GameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    StandardScreen goToScreen;
    var questionConfig = GeoQuizGameQuestionConfig();
    //
    ////
    // category = questionConfig.cat1;
    ////
    //

    return GeoQuizMainMenuScreen(this);
  }

  @override
  @protected
  GameContext createGameContext(CampaignLevel campaignLevel) {
    return GameContextService().createGameContextWithQuestions([]);
  }
}
