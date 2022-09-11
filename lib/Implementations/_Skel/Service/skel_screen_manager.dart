import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Questions/skel_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Screens/skel_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Screens/skel_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/_Skel/Service/skel_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

class SkelScreenManager extends GameScreenManager {
  SkelScreenManager({Key? key}) : super(key: key);

  @override
  State<SkelScreenManager> createState() => SkelScreenManagerState();
}

class SkelScreenManagerState extends State<SkelScreenManager>
    with GameScreenManagerState<SkelGameContext> {
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
    if (standardScreen.runtimeType == SkelMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return SkelMainMenuScreen(
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
    SkelGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return SkelQuestionScreen(
      this,
      key: UniqueKey(),
      gameContext: gameContext,
      questionInfo:
          gameContext.gameUser.getRandomQuestion(difficulty, category),
    );
  }

  @override
  @protected
  SkelGameContext createGameContext(CampaignLevel campaignLevel) {
    return SkelGameContextService().createGameContext(campaignLevel);
  }
}
