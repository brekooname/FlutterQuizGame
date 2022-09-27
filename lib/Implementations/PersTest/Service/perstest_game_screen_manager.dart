import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/perstest_game_over_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/perstest_game_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/perstest_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

//ignore: must_be_immutable
class PersTestGameScreenManager extends GameScreenManager {
  PersTestGameScreenManager({Key? key}) : super(key: key);

  @override
  State<PersTestGameScreenManager> createState() =>
      PersTestGameScreenManagerState();
}

class PersTestGameScreenManagerState extends State<PersTestGameScreenManager>
    with GameScreenManagerState<PersTestGameContext> {
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
    if (standardScreen.runtimeType == PersTestMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return PersTestMainMenuScreen(
      this,
      key: UniqueKey(),
    );
  }

  void showGameOverScreen(
      QuestionDifficulty difficulty, QuestionCategory category) {
    setCurrentScreenState(PersTestGameOverScreen(this,
        difficulty: difficulty, category: category));
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
    PersTestGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return PersTestQuestionScreen(this,
        key: UniqueKey(),
        gameContext: gameContext,
        category: category,
        difficulty: difficulty);
  }

  @override
  @protected
  PersTestGameContext createGameContext(CampaignLevel campaignLevel) {
    return PersTestGameContextService().createGameContext(campaignLevel);
  }
}
