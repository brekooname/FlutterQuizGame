import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Constants/astronomy_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Questions/astronomy_timeline_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/Astronomy/Service/astronomy_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Lib/Animation/animation_background.dart';
import '../Components/astronomy_level_header.dart';

class AstronomyQuestionScreen extends GameScreen<AstronomyGameContext,
        AstronomyScreenManagerState, AstronomyCampaignLevelService>
    with QuizOptionsGameScreen<QuizQuestionManager> {
  final AstronomyGameQuestionConfig _astronomyGameQuestionConfig =
      AstronomyGameQuestionConfig();
  late final AstronomyGameType _gameType;

  AstronomyQuestionScreen(
    AstronomyScreenManagerState gameScreenManagerState, {
    Key? key,
    required AstronomyGameContext gameContext,
    required QuestionInfo questionInfo,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key) {
    _gameType = campaignLevelService.findGameTypeForCategory(category);
    initQuizOptionsScreen(
      QuizQuestionManager<AstronomyGameContext, AstronomyLocalStorage>(
          gameContext, questionInfo, AstronomyLocalStorage()),
      questionImage: _getQuestionImage(questionInfo),
      optionsButtonSkinConfig: _getOptionsButtonSkinConfig(),
    );
  }

  ButtonSkinConfig _getOptionsButtonSkinConfig() {
    return campaignLevelService.isPlanetsGameType(_gameType)
        ? ButtonSkinConfig(
            backgroundColor: Colors.blue.withOpacity(0.5),
            borderRadius: FontConfig.standardBorderRadius * 4)
        : _astronomyGameQuestionConfig.isTimelineCategory(category)
            ? ButtonSkinConfig(
                backgroundColor: Colors.purple.withOpacity(0.5),
                borderColor: Colors.transparent,
                buttonUnpressedShadowColor: Colors.transparent)
            : ButtonSkinConfig(
                backgroundColor: Colors.blue.withOpacity(0.5),
                borderRadius: FontConfig.standardBorderRadius);
  }

  @override
  AstronomyCampaignLevelService get campaignLevelService =>
      AstronomyCampaignLevelService();

  Image? _getQuestionImage(QuestionInfo questionInfo) {
    if (campaignLevelService.isImageQuestionGameType(_gameType)) {
      var imageName = questionInfo.question.index.toString();
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
    return 12;
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
    } else if (_astronomyGameQuestionConfig.isTimelineCategory(category)) {
      return _getTimelineAnswerBtnSize();
    } else {
      return super.getAnswerBtnSize();
    }
  }

  Size _getTimelineAnswerBtnSize() =>
      Size(screenDimensions.dimen(80), screenDimensions.dimen(20));
}

class AstronomyQuestionScreenState extends State<AstronomyQuestionScreen>
    with ScreenState, LabelMixin {
  final QuizQuestionContainer _quizQuestionContainer = QuizQuestionContainer();

  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      _onHintButtonClick();
    });
    var questionOpen = widget.currentQuestionInfo.isQuestionOpen();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!questionOpen) {
        widget.processNextGameScreenCallBack().call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget container =
        widget.campaignLevelService.isPlanetsGameType(widget._gameType)
            ? _createPlanetsQuestionContainer()
            : widget._astronomyGameQuestionConfig
                    .isTimelineCategory(widget.category)
                ? _createTimelineQuestionContainer()
                : _createQuestionContainer();
    return AnimateBackground(
        mainContent: container,
        particleImage: imageService.getSpecificImage(
            imageName: "stars", imageExtension: "png"));
  }

  void _refreshCurrentScreen() {
    widget.gameScreenManagerState.setCurrentScreenState(
        widget.gameScreenManagerState.createAstronomyQuestionScreen(
            widget.gameContext, widget.currentQuestionInfo));
  }

  Widget _createQuestionContainer() {
    Widget questionContainer = _createQuestionTextContainer();
    Widget optionsRows = widget.createOptionRows(
        setStateCallback,
        widget.processNextGameScreenCallBack(
            refreshScreenAfterExtraContentPurchase: _refreshCurrentScreen),
        widgetBetweenImageAndOptionRows: SizedBox(
          height: screenDimensions.dimen(3),
        ),
        questionImageHeightPercent: 45,
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
          height: screenDimensions.dimen(3),
        ),
        optionsRows,
        spacer,
      ],
    );
  }

  Widget _createTimelineQuestionContainer() {
    Widget questionContainer = _createQuestionTextContainer();
    AstronomyTimelineQuestionService questionService = widget
        .currentQuestionInfo
        .question
        .questionService as AstronomyTimelineQuestionService;
    Set<String> quizAnswerOptions = questionService
        .getQuizAnswerOptions(widget.currentQuestionInfo.question);
    List<String> orderedOpts = questionService.getOrderedAnswerOptions(
        quizAnswerOptions, widget.category);

    List<Widget> optBtns =
        orderedOpts.map((e) => _createTimelineOptionBtn(e)).toList();
    const spacer = Spacer();
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createAstronomyLevelHeader(),
          spacer,
          questionContainer,
          SizedBox(
            height: screenDimensions.dimen(10),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: optBtns,
          ),
          spacer,
        ]);
  }

  Widget _createQuestionTextContainer() {
    return _quizQuestionContainer.createQuestionTextContainer(
      widget.currentQuestionInfo.question,
      3,
      4,
      questionColor: Colors.white,
      prefixColor: Colors.grey.shade400,
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
      maxLines: 3,
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
        _createPlanetsOptionBtn(
          quizAnswerOptions.elementAt(0),
        ),
        _createPlanetsOptionBtn(
          quizAnswerOptions.elementAt(1),
        )
      ],
    );
    var secondRowOpts = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _createPlanetsOptionBtn(
          quizAnswerOptions.elementAt(2),
        ),
        _createPlanetsOptionBtn(
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

  Widget _createTimelineOptionBtn(String optText) {
    MyText optMyText = MyText(
      text: optText,
      maxLines: 2,
      width: widget._getTimelineAnswerBtnSize().width / 1.1,
      fontConfig: FontConfig(
          fontWeight: FontWeight.w700,
          borderColor: Colors.black,
          fontSize: FontConfig.getCustomFontSize(1.1),
          fontColor: Colors.white),
    );
    return widget.createPossibleAnswerButton(
        setStateCallback,
        widget.processNextGameScreenCallBack(
            refreshScreenAfterExtraContentPurchase: _refreshCurrentScreen),
        optText,
        customContent: optMyText);
  }

  Widget _createPlanetsOptionBtn(String optText) {
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
          fontSize: FontConfig.getCustomFontSize(1),
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
        setStateCallback,
        widget.processNextGameScreenCallBack(
            refreshScreenAfterExtraContentPurchase: _refreshCurrentScreen),
        optText,
        customContent: btnContent ?? optMyText);
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

  void _onHintButtonClick() {
    widget.quizQuestionManager.onHintButtonClickForCatDiff(
        setStateCallback, widget.processNextGameScreenCallBack());
  }

  void setStateCallback() {
    setState(() {});
  }
}
