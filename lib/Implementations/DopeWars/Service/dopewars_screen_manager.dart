import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Questions/dopewars_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Screens/dopewars_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Screens/dopewars_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/DopeWars/Service/dopewars_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class DopeWarsScreenManager extends GameScreenManager {
  DopeWarsScreenManager({Key? key}) : super(key: key);

  @override
  State<DopeWarsScreenManager> createState() => DopeWarsScreenManagerState();
}

class DopeWarsScreenManagerState extends State<DopeWarsScreenManager>
    with GameScreenManagerState<DopeWarsGameContext> {
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
  bool goBack(StandardScreen standardScreen) {
    if (standardScreen.runtimeType == DopeWarsMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return DopeWarsMainMenuScreen(
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
    DopeWarsGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return DopeWarsQuestionScreen(this,
        key: UniqueKey(),
        gameContext: gameContext,
        category: category,
        difficulty: difficulty);
  }

  @override
  @protected
  DopeWarsGameContext createGameContext(CampaignLevel campaignLevel) {
    return DopeWarsContextService().createGameContext();
  }
}
