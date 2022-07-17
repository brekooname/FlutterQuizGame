import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Animation/animation_background.dart';
import '../Components/astronomy_level_header.dart';

class AstronomyQuestionScreen extends GameScreen<AstronomyGameContext,
        AstronomyScreenManagerState, AstronomyCampaignLevelService>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  final AstronomyGameQuestionConfig _astronomyGameQuestionConfig =
      AstronomyGameQuestionConfig();
  late AstronomyGameType _gameType;

  AstronomyQuestionScreen(
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
    _gameType = campaignLevelService.findGameTypeForCategory(category);
    initQuizOptionsScreen(
      QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
          gameContext, currentQuestionInfo, AstronomyLocalStorage()),
      currentQuestionInfo,
      questionImage: _getQuestionImage(),
      optionsButtonSkinConfig: campaignLevelService.isPlanetsGameType(_gameType)
          ? ButtonSkinConfig(
              backgroundColor: Colors.blue.withOpacity(0.5),
              borderRadius: FontConfig.standardBorderRadius * 4)
          : ButtonSkinConfig(
              backgroundColor: Colors.blue.withOpacity(0.5),
              borderRadius: FontConfig.standardBorderRadius),
    );
  }

  Image? _getQuestionImage() {
    if (campaignLevelService.isImageQuestionGameType(_gameType)) {
      var imageName = currentQuestionInfo.question.index.toString();
      var module = "questions/" + category.name;
      return imageService.getSpecificImage(
          module: module, imageExtension: "jpg", imageName: imageName);
    }
    return null;
  }

  @override
  State<AstronomyQuestionScreen> createState() =>
      AstronomyQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }

  @override
  double getAnswerButtonPaddingBetween() {
    return campaignLevelService.isPlanetsGameType(_gameType)
        ? screenDimensions.dimen(7)
        : super.getAnswerButtonPaddingBetween();
  }

  @override
  Size getAnswerBtnSize() {
    if (campaignLevelService.isPlanetsGameType(_gameType)) {
      var dimen = screenDimensions.dimen(36);
      return Size(dimen, dimen);
    } else {
      return super.getAnswerBtnSize();
    }
  }
}

class AstronomyQuestionScreenState extends State<AstronomyQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    Widget container =
        widget.campaignLevelService.isPlanetsGameType(widget._gameType)
            ? _createPlanetsQuestionContainer()
            : _createQuestionContainer();
    return AnimateBackground(
        mainContent: container,
        particleImage: imageService.getSpecificImage(
            imageName: "stars", imageExtension: "png"));
  }

  Widget _createQuestionContainer() {
    Widget questionContainer = createQuestionTextContainer(
      widget.currentQuestionInfo.question,
      2,
      4,
      questionColor: Colors.white,
      questionFontSize: FontConfig.getCustomFontSize(1.3),
      questionContainerDecoration: BoxDecoration(
          image: DecorationImage(
        repeat: ImageRepeat.repeat,
        opacity: 0.1,
        image: imageService
            .getSpecificImage(
                imageName: "title_background", imageExtension: "png")
            .image,
      )),
    );
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.goToNextGameScreenCallBack(context),
        widgetBetweenImageAndOptionRows: SizedBox(
          height: screenDimensions.dimen(10),
        ),
        optionTextFontConfig:
            FontConfig(fontColor: Colors.white, borderColor: Colors.black));
    const spacer = Spacer();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _createAstronomyLevelHeader(),
        spacer,
        questionContainer,
        SizedBox(
          height: screenDimensions.dimen(10),
        ),
        optionsRows,
        spacer,
      ],
    );
  }

  Widget _createPlanetsQuestionContainer() {
    var planetDimen = screenDimensions.dimen(25);
    var question = widget.currentQuestionInfo.question;
    var planetId = question.index;
    var quizAnswerOptions =
        question.questionService.getQuizAnswerOptions(question);
    var planetImg = imageService.getSpecificImage(
        maxWidth: planetDimen,
        maxHeight: planetDimen,
        module: "planets",
        imageName: planetId.toString(),
        imageExtension: "png");
    var questionText = MyText(
      width: screenDimensions.dimen(70),
      maxLines: 2,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize: FontConfig.getCustomFontSize(1.0),
          fontColor: Colors.white),
      text: widget._astronomyGameQuestionConfig
          .getPrefixToBeDisplayedForQuestion(
              widget.category, widget.difficulty, 0),
    );
    debugPrint(widget.currentQuestionInfo.question.rawString);
    var firstRowOpts = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createOptionBtn(
          quizAnswerOptions.elementAt(0),
        ),
        createOptionBtn(
          quizAnswerOptions.elementAt(1),
        )
      ],
    );
    var secondRowOpts = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createOptionBtn(
          quizAnswerOptions.elementAt(2),
        ),
        createOptionBtn(
          quizAnswerOptions.elementAt(3),
        )
      ],
    );
    var planetName = MyText(
        fontConfig: FontConfig(
            fontWeight: FontWeight.w700,
            borderColor: Colors.black,
            fontSize: FontConfig.getCustomFontSize(1.3),
            fontColor: Colors.white),
        text: widget._astronomyGameQuestionConfig.planets
            .where((element) => element.id == planetId)
            .first
            .name);
    var margin = SizedBox(
      height: screenDimensions.dimen(2),
    );
    const spacer = Spacer();
    var container = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createAstronomyLevelHeader(),
          spacer,
          margin,
          margin,
          questionText,
          margin,
          firstRowOpts,
          planetName,
          margin,
          planetImg,
          secondRowOpts,
          spacer,
        ]);
    return container;
  }

  void _onHintButtonClick() {
    widget.quizQuestionManager.onHintButtonClickForCatDiff(setStateCallback);
  }

  Widget _createAstronomyLevelHeader() {
    return AstronomyLevelHeader(
      gameContext: widget.gameContext,
      availableHints: widget.gameContext.amountAvailableHints,
      animateScore: widget.quizQuestionManager.isGameFinished(),
      disableHintBtn:
          widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
      hintButtonOnClick: () {
        _onHintButtonClick();
      },
    );
  }

  Widget createOptionBtn(String optText) {
    Widget? btnContent;
    var catsWithEarthIcon = [
      widget._astronomyGameQuestionConfig.cat1,
      widget._astronomyGameQuestionConfig.cat4
    ].contains(widget.category);
    MyText optMyText = MyText(
      text: optText,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize: FontConfig.getCustomFontSize(
              catsWithEarthIcon && optText.length > 6 ? 1.0 : 1.1),
          fontColor: Colors.white),
    );
    if (catsWithEarthIcon) {
      btnContent = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          optMyText,
          SizedBox(
            width: screenDimensions.dimen(2),
          ),
          imageService.getSpecificImage(
              maxWidth: screenDimensions.dimen(8),
              imageName: "earth_stroke",
              imageExtension: "png",
              module: "planets")
        ],
      );
    }
    return widget.createPossibleAnswerButton(
        setStateCallback, widget.goToNextGameScreenCallBack(context), optText,
        customContent: btnContent ?? optMyText);
  }

  void setStateCallback() {
    setState(() {});
  }
}
