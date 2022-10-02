import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Screens/geoquiz_game_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Screens/geoquiz_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

import 'geoquiz_gamecontext_service.dart';

//ignore: must_be_immutable
class GeoQuizGameScreenManager extends GameScreenManager {
  GeoQuizGameScreenManager({Key? key}) : super(key: key);

  @override
  State<GeoQuizGameScreenManager> createState() =>
      GeoQuizGameScreenManagerState();
}

class GeoQuizGameScreenManagerState extends State<GeoQuizGameScreenManager>
    with GameScreenManagerState<GeoQuizGameContext> {
  @override
  void initState() {
    super.initState();
    RatePopupService ratePopupService = RatePopupService();
    ratePopupService.showRateAppPopup();

    showMainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return createScreen(widget.currentScreen);
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
    return GeoQuizMainMenuScreen(
      this,
      key: UniqueKey(),
    );
  }

  @override
  void showNextGameScreen(
      CampaignLevel campaignLevel, GeoQuizGameContext gameContext) {
    gameContext.gameUser
        .getAllQuestions([QuestionInfoStatus.lost]).forEach((element) {
      gameContext.gameUser.resetQuestion(element);
    });
    super.showNextGameScreen(campaignLevel, gameContext);
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
    GeoQuizGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return GeoQuizQuestionScreen(
      this,
      key: UniqueKey(),
      gameContext: gameContext,
      difficulty: difficulty,
      category: category,
    );
  }

  @override
  @protected
  GeoQuizGameContext createGameContext(CampaignLevel campaignLevel) {
    return GeoQuizGameContextService().createGameContext(campaignLevel);
  }
}
