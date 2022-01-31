import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Components/geoquiz_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_experience_map.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/AnswerOptions/geoquiz_options_question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_gamecontext_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import 'geoquiz_game_hangman_screen.dart';

class GeoQuizQuestionScreen
    extends GameScreen<GeoQuizGameContext, GeoQuizGameScreenManagerState>
    with QuizOptionsGameScreen<GeoQuizGameContext> {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();
  final _geoQuizLocalStorage = GeoQuizLocalStorage();
  final GeoQuizCampaignLevelExperienceMap _campaignLevelExperienceMap =
      GeoQuizCampaignLevelExperienceMap();
  bool animateWrongAnswer = false;

  GeoQuizQuestionScreen(
    GeoQuizGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required GeoQuizGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            GeoQuizCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [gameContext.gameUser.getRandomQuestion(difficulty, category)],
            key: key) {
    if (currentQuestionInfo.question.questionService
        is GeoQuizOptionsQuestionService) {
      (currentQuestionInfo.question.questionService
              as GeoQuizOptionsQuestionService)
          .clearCache();
    }

    initQuizOptionsScreen(
        gameContext, _geoQuizLocalStorage, currentQuestionInfo,
        questionImage: getQuestionImage(category),
        zoomableImage: GeoQuizGameQuestionConfig().cat9 == category,
        buttonSkinConfig: ButtonSkinConfig(
            backgroundGradient: RadialGradient(radius: 4, colors: [
          ColorUtil.colorDarken(Colors.lightBlue.shade100, 0.05),
          Colors.lightBlue.shade600,
        ])),
        multipleCorrectAnswersButtonSkinConfig:
            ButtonSkinConfig(backgroundColor: Colors.purple.shade100));
  }

  @override
  void executeOnPressedCorrectAnswer() {
    super.executeOnPressedCorrectAnswer();
    if (isGameFinishedSuccessful()) {
      var amountToIncreaseScore = _campaignLevelExperienceMap
          .getExperienceLevel(campaignLevel)
          .increaseExperiencePerCorrectAnswerAmount;
      gameContext.consecutiveCorrectAnswers =
          gameContext.consecutiveCorrectAnswers + 1;
      gameContext.gameScore = gameContext.gameScore + amountToIncreaseScore;
      if (allQuestionsAnswered) {
        _geoQuizLocalStorage.incrementExperience(
            gameContext.gameScore * gameContext.consecutiveCorrectAnswers);
      }
    }
  }

  @override
  void executeOnPressedWrongAnswer(String answerBtnText) {
    super.executeOnPressedWrongAnswer(answerBtnText);
    if (isGameFinishedFailed() && gameContext.consecutiveCorrectAnswers > 0) {
      animateWrongAnswer = true;
    }
    gameContext.consecutiveCorrectAnswers =
        max(gameContext.consecutiveCorrectAnswers - 1, 0);
  }

  @override
  Duration get durationGoToNextScreen =>
      allQuestionsAnswered && gameContext.consecutiveCorrectAnswers > 1
          ? const Duration(milliseconds: 3000)
          : super.durationGoToNextScreen;

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return GeoQuizHangmanScreen.showInterstitialAdEveryNQuestions;
  }

  bool get allQuestionsAnswered =>
      GeoQuizGameContextService.numberOfQuestionsPerGame ==
      gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);

  @override
  State<GeoQuizQuestionScreen> createState() => GeoQuizQuestionScreenState();

  Image? getQuestionImage(QuestionCategory category) {
    if (_geoQuizCountryUtils.isCategoryWithImageQuestions(category)) {
      var flagsOrMaps = _geoQuizCountryUtils.isFlagsOrMapsCategory(category);
      var imageName = flagsOrMaps
          ? currentQuestionInfo.question.rawString
          : currentQuestionInfo.question.index.toString();
      var module = flagsOrMaps
          ? "questions/images/" + category.name
          : "questions/images/" + difficulty.name + "/" + category.name;
      return imageService.getSpecificImage(
          module: module, imageExtension: "jpg", imageName: imageName);
    }
    return null;
  }
}

class GeoQuizQuestionScreenState extends State<GeoQuizQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      widget.onHintButtonClick(setStateCallback);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget questionContainer = createQuestionTextContainer(
        widget.currentQuestionInfo.question, 4, 4,
        questionContainerDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorUtil.colorDarken(Colors.blue.shade100, -0.1),
                  Colors.blue.shade100,
                ]),
            border: Border.all(
                color: Colors.blue.shade700,
                width: screenDimensions.dimen(0.3)),
            borderRadius:
                BorderRadius.circular(FontConfig.standardBorderRadius * 0.2)));
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.goToNextGameScreenCallBack(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        createHeader(),
        questionContainer,
        optionsRows,
        const Spacer(),
      ],
    );
  }

  GeoQuizGameLevelHeader createHeader() {
    var gameFinishedSuccessful = widget.isGameFinishedSuccessful();
    var header = GeoQuizGameLevelHeader(
      score: widget.gameContext.gameScore,
      nrOfCorrectAnsweredQuestions: widget.gameContext.gameUser
          .countAllQuestions([QuestionInfoStatus.won]),
      consecutiveCorrectAnswers: widget.gameContext.consecutiveCorrectAnswers,
      availableHints: widget.gameContext.amountAvailableHints,
      allQuestionsAnswered: widget.allQuestionsAnswered,
      animateScore: gameFinishedSuccessful,
      animateWrongAnswer: widget.animateWrongAnswer,
      animateStepIncrease: gameFinishedSuccessful,
      disableHintBtn: widget.hintDisabledPossibleAnswers.isNotEmpty,
      hintButtonOnClick: () {
        widget.onHintButtonClick(setStateCallback);
      },
    );
    widget.animateWrongAnswer = false;
    return header;
  }

  void setStateCallback() {
    setState(() {});
  }
}
