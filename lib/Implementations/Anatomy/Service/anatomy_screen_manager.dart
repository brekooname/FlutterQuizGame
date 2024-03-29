import 'package:flutter/cupertino.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/ImageClick/image_click_question_category_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Questions/anatomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Screens/anatomy_image_click_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Screens/anatomy_levels_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Screens/anatomy_main_menu_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Screens/anatomy_question_screen.dart';
import 'package:flutter_app_quiz_game/Implementations/Anatomy/Service/anatomy_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/rate_app_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';

//ignore: must_be_immutable
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
    RatePopupService ratePopupService = RatePopupService();
    ratePopupService.showRateAppPopup();

    showMainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return createScreen(widget.currentScreen);
  }

  @override
  StandardScreen getScreenAfterGameOver(GameContext gameContext) {
    return _createAnatomyLevelsScreen(
        gameContext.questionConfig.categories.first);
  }

  void showLevelsScreen(QuestionCategory category) {
    setCurrentScreenState(_createAnatomyLevelsScreen(category));
  }

  AnatomyLevelsScreen _createAnatomyLevelsScreen(QuestionCategory category) {
    return AnatomyLevelsScreen(
      this,
      key: UniqueKey(),
      category: category,
    );
  }

  @override
  void showNextGameScreen(
      CampaignLevel campaignLevel, AnatomyGameContext gameContext) {
    gameContext.gameUser
        .getAllQuestions([QuestionInfoStatus.lost]).forEach((element) {
      gameContext.gameUser.resetQuestion(element);
    });
    super.showNextGameScreen(campaignLevel, gameContext);
  }

  @override
  bool goBack(StandardScreen standardScreen) {
    if (standardScreen.runtimeType == AnatomyMainMenuScreen) {
      return true;
    } else if (standardScreen.runtimeType == AnatomyImageClickScreen) {
      showLevelsScreen((standardScreen as AnatomyImageClickScreen).category);
      return false;
    } else if (standardScreen.runtimeType == AnatomyQuestionScreen) {
      showLevelsScreen((standardScreen as AnatomyQuestionScreen).category);
      return false;
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
    if (category.getQuestionCategoryService(difficulty)
        is ImageClickCategoryQuestionService) {
      return AnatomyImageClickScreen(
        this,
        key: UniqueKey(),
        gameContext: gameContext,
        questionInfo:
            gameContext.gameUser.getRandomQuestion(difficulty, category),
      );
    } else {
      return AnatomyQuestionScreen(
        this,
        key: UniqueKey(),
        gameContext: gameContext,
        questionInfo:
            gameContext.gameUser.getRandomQuestion(difficulty, category),
      );
    }
  }

  @override
  @protected
  AnatomyGameContext createGameContext(CampaignLevel campaignLevel) {
    return AnatomyGameContextService().createGameContext(campaignLevel);
  }
}
