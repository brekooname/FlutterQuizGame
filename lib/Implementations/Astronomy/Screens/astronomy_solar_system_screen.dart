import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Game/Question/Model/question_category.dart';
import '../../../Game/Question/Model/question_difficulty.dart';
import '../../../Lib/Screen/Game/ImageClick/image_click_screen.dart';
import '../../../Lib/Screen/Game/quiz_question_manager.dart';

class AstronomySolarSystemScreen
    extends GameScreen<AstronomyGameContext, AstronomyScreenManagerState>
    with ImageClickScreen<QuizQuestionManager> {
  AstronomyGameQuestionConfig gameQuestionConfig =
      AstronomyGameQuestionConfig();

  AstronomySolarSystemScreen(
    AstronomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AstronomyGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            AstronomyCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    initImageClickScreen(
      QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
          gameContext, currentQuestionInfo, AstronomyLocalStorage()),
      currentQuestionInfo,
      gameQuestionConfig.categoryDiagramImgDimen
          .get<QuestionCategory, Size>(currentQuestionInfo.question.category)!,
    );
  }

  @override
  State<AstronomySolarSystemScreen> createState() =>
      AstronomySolarSystemScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }

  @override
  bool showAnswerPointerOnOrigin() {
    return true;
  }
}

class AstronomySolarSystemScreenState extends State<AstronomySolarSystemScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget.initImageToClick();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(widget.imageToClick.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.createImageClickContainer(() {
      setState(() {});
    }, widget.goToNextGameScreenCallBack(context));
  }
}
