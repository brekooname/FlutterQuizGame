import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Questions/hangman_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Screens/hangman_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Screens/hangman_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Hangman/Service/hangman_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

//ignore: must_be_immutable
class HangmanScreenManager extends GameScreenManager {
  HangmanScreenManager({Key? key}) : super(key: key);

  @override
  State<HangmanScreenManager> createState() => HangmanScreenManagerState();
}

class HangmanScreenManagerState extends State<HangmanScreenManager>
    with GameScreenManagerState<HangmanGameContext> {
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
    if (standardScreen.runtimeType == HangmanMainMenuScreen) {
      return true;
    } else {
      showMainScreen();
      return false;
    }
  }

  @override
  StandardScreen createMainScreen() {
    return HangmanMainMenuScreen(
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
    HangmanGameContext gameContext,
    QuestionDifficulty difficulty,
    QuestionCategory category,
  ) {
    return HangmanQuestionScreen(
      this,
      key: UniqueKey(),
      gameContext: gameContext,
      questionInfo:
          gameContext.gameUser.getRandomQuestion(difficulty, category),
    );
  }

  @override
  @protected
  HangmanGameContext createGameContext(CampaignLevel campaignLevel) {
    return HangmanGameContextService().createGameContext(campaignLevel);
  }
}
