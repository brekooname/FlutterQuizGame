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
import '../../../Game/Question/QuestionCategoryService/ImageClick/image_click_question_parser.dart';
import '../../../Lib/Animation/animation_background.dart';
import '../../../Lib/Button/button_skin_config.dart';
import '../../../Lib/Font/font_config.dart';
import '../../../Lib/Screen/Game/ImageClick/image_click_screen.dart';
import '../../../Lib/Screen/Game/Options/quiz_question_manager.dart';
import '../../../Lib/Text/my_text.dart';
import '../Components/astronomy_level_header.dart';

class AstronomySolarSystemScreen extends GameScreen<
    AstronomyGameContext,
    AstronomyScreenManagerState,
    AstronomyCampaignLevelService> with ImageClickScreen<QuizQuestionManager> {
  AstronomyGameQuestionConfig gameQuestionConfig =
      AstronomyGameQuestionConfig();
  late Size _rawImageToClickSize;

  AstronomySolarSystemScreen(
    AstronomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required AstronomyGameContext gameContext,
  }) : super(gameScreenManagerState, gameContext,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    _rawImageToClickSize = gameQuestionConfig.categoryDiagramImgDimen
        .get<QuestionCategory, Size>(currentQuestionInfo.question.category)!;
    initImageClickScreen(
        QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
            gameContext, currentQuestionInfo, AstronomyLocalStorage()),
        currentQuestionInfo,
        _rawImageToClickSize,
        imageContainerHeightPercent: 85,
        answerBtnSkin: ButtonSkinConfig(
            buttonUnpressedShadowColor: Colors.transparent,
            borderRadius: FontConfig.standardBorderRadius * 4,
            borderColor: Colors.red,
            backgroundColor: Colors.transparent));
  }

  @override
  AstronomyCampaignLevelService get campaignLevelService =>
      AstronomyCampaignLevelService();

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

  @override
  bool showAnswerLabelOnLeftSide(ImageClickInfo imageClickInfo) {
    return imageClickInfo.x > 50;
  }

  @override
  Size getImageToClickAdjustedForScreenSize() {
    var imgWidth = screenDimensions.w(90);
    return Size(
        imgWidth,
        screenDimensions.getNewHeightForNewWidth(
            imgWidth, _rawImageToClickSize.width, _rawImageToClickSize.height));
  }
}

class AstronomySolarSystemScreenState extends State<AstronomySolarSystemScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {});
    widget.initImageToClick();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(widget.imageToClick.image, context);
  }

  @override
  Widget build(BuildContext context) {
    var imageClickContainer = widget.createImageClickContainer(() {
      setState(() {});
    }, widget.processNextGameScreenCallBack());
    Widget mainColumn = Column(
      children: [
        _createAstronomyLevelHeader(),
        _createQuestionContainer(),
        imageClickContainer,
      ],
    );
    return AnimateBackground(
      mainContent: mainColumn,
      particleImage: imageService.getSpecificImage(
          imageName: "stars", imageExtension: "png"),
    );
  }

  Widget _createAstronomyLevelHeader() {
    return AstronomyLevelHeader(
      gameContext: widget.gameContext,
      availableHints: widget.gameContext.amountAvailableHints,
      animateScore: widget.quizQuestionManager.isGameFinished(),
      disableHintBtn: true,
      hintButtonOnClick: null,
    );
  }

  Widget _createQuestionContainer() {
    return MyText(
      fontConfig: FontConfig(
          fontColor: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: FontConfig.getCustomFontSize(1.3),
          borderColor: Colors.black),
      maxLines: 1,
      width: screenDimensions.dimen(80),
      text: widget.currentQuestionInfo.question.questionToBeDisplayed,
    );
  }
}
