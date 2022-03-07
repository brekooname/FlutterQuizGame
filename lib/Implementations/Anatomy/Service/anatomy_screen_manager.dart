import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Screens/anatomy_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Screens/anatomy_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class AnatomyScreenManager extends GameScreenManager {
  AnatomyScreenManager({Key? key}) : super(key: key);

  @override
  State<AnatomyScreenManager> createState() => AnatomyScreenManagerState();
}

class AnatomyScreenManagerState extends State<AnatomyScreenManager>
    with GameScreenManagerState<AnatomyGameContext> {
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
    if (standardScreen.runtimeType == AnatomyMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return AnatomyMainMenuScreen(
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
    AnatomyGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return AnatomyQuestionScreen(this,
        key: UniqueKey(),
        gameContext: gameContext,
        category: category,
        difficulty: difficulty);
  }

  @override
  @protected
  AnatomyGameContext createGameContext(CampaignLevel campaignLevel) {
    return AnatomyGameContextService().createGameContext(campaignLevel);
  }
}
