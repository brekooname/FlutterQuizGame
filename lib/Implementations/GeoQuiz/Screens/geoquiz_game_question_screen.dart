import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
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
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_question_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

class GeoQuizQuestionScreen extends GameScreen<GeoQuizGameContext,
        GeoQuizGameScreenManagerState, GeoQuizCampaignLevelService>
    with QuizOptionsGameScreen<GeoQuizQuizQuestionManager> {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();

  GeoQuizQuestionScreen(
    GeoQuizGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required GeoQuizGameContext gameContext,
    required QuestionInfo questionInfo,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key) {
    if (questionInfo.question.questionService
        is GeoQuizOptionsQuestionService) {
      (questionInfo.question.questionService as GeoQuizOptionsQuestionService)
          .clearCache();
    }

    initQuizOptionsScreen(createQuizQuestionManager(questionInfo),
        questionImage: getQuestionImage(questionInfo, category),
        zoomableImage: GeoQuizGameQuestionConfig().cat9 == category,
        optionsButtonSkinConfig: ButtonSkinConfig(
            backgroundGradient: RadialGradient(radius: 4, colors: [
          ColorUtil.colorDarken(Colors.lightBlue.shade100, 0.05),
          Colors.lightBlue.shade600,
        ])),
        multipleCorrectAnswersButtonSkinConfig:
            ButtonSkinConfig(backgroundColor: Colors.purple.shade100));
  }

  @override
  GeoQuizCampaignLevelService get campaignLevelService =>
      GeoQuizCampaignLevelService();

  GeoQuizQuizQuestionManager createQuizQuestionManager(
      QuestionInfo questionInfo) {
    return GeoQuizQuizQuestionManager(
        gameContext, questionInfo, GeoQuizLocalStorage(), campaignLevel);
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 12;
  }

  @override
  State<GeoQuizQuestionScreen> createState() => GeoQuizQuestionScreenState();

  Image? getQuestionImage(
      QuestionInfo questionInfo, QuestionCategory category) {
    if (_geoQuizCountryUtils.isCategoryWithImageQuestions(category)) {
      var flagsOrMaps = _geoQuizCountryUtils.isFlagsOrMapsCategory(category);
      var imageName = flagsOrMaps
          ? questionInfo.question.rawString
          : questionInfo.question.index.toString();
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
    with ScreenState {
  final QuizQuestionContainer _quizQuestionContainer = QuizQuestionContainer();

  @override
  void initState() {
    super.initState();
    initScreenState(onUserEarnedReward: () {
      widget.quizQuestionManager.onHintButtonClickForDiff(
          setStateCallback, widget.processNextGameScreenCallBack());
    });
  }

  @override
  Widget build(BuildContext context) {
    var gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorUtil.colorDarken(Colors.blue.shade100, -0.1),
          Colors.blue.shade100,
        ]);
    Widget questionContainer = _quizQuestionContainer
        .createQuestionTextContainer(widget.currentQuestionInfo.question, 4, 4,
            questionContainerDecoration: BoxDecoration(
                gradient: gradient,
                border: Border.all(
                    color: Colors.blue.shade700,
                    width: screenDimensions.dimen(0.3)),
                borderRadius: BorderRadius.circular(
                    FontConfig.standardBorderRadius * 0.2)));
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.processNextGameScreenCallBack());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        createHeader(),
        const Spacer(),
        questionContainer,
        optionsRows,
        const Spacer(),
        const Spacer(),
      ],
    );
  }

  GeoQuizGameLevelHeader createHeader() {
    var gameFinishedSuccessful =
        widget.quizQuestionManager.isGameFinishedSuccessful();
    var header = GeoQuizGameLevelHeader(
      score: widget.gameContext.gameScore,
      nrOfCorrectAnsweredQuestions: widget.gameContext.gameUser
          .countAllQuestions([QuestionInfoStatus.won]),
      consecutiveCorrectAnswers: widget.gameContext.consecutiveCorrectAnswers,
      availableHints: widget.gameContext.amountAvailableHints,
      allQuestionsAnswered: widget.quizQuestionManager.allQuestionsAnswered,
      animateScore: gameFinishedSuccessful,
      animateWrongAnswer: widget.quizQuestionManager.animateWrongAnswer,
      animateStepIncrease: gameFinishedSuccessful,
      disableHintBtn:
          widget.quizQuestionManager.hintDisabledPossibleAnswers.isNotEmpty,
      hintButtonOnClick: () {
        widget.quizQuestionManager.onHintButtonClickForDiff(
            setStateCallback, widget.processNextGameScreenCallBack());
      },
    );
    widget.quizQuestionManager.animateWrongAnswer = false;
    return header;
  }

  void setStateCallback() {
    setState(() {});
  }
}

class GeoQuizQuizQuestionManager
    extends QuizQuestionManager<GeoQuizGameContext, GeoQuizLocalStorage> {
  final GeoQuizCampaignLevelExperienceMap _campaignLevelExperienceMap =
      GeoQuizCampaignLevelExperienceMap();
  bool animateWrongAnswer = false;
  CampaignLevel campaignLevel;

  GeoQuizQuizQuestionManager(
      GeoQuizGameContext gameContext,
      QuestionInfo currentQuestionInfo,
      GeoQuizLocalStorage quizGameLocalStorage,
      this.campaignLevel)
      : super(gameContext, currentQuestionInfo, quizGameLocalStorage);

  bool get allQuestionsAnswered =>
      GeoQuizGameContextService.numberOfQuestionsPerGame ==
      gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);

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
        quizGameLocalStorage.incrementExperience(
            gameContext.gameScore * gameContext.consecutiveCorrectAnswers);
      }
    }
  }

  @override
  void executeOnPressedWrongAnswer() {
    super.executeOnPressedWrongAnswer();
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
}
