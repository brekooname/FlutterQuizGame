import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_country_utils.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Questions/geoquiz_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Service/geoquiz_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/Options/quiz_options_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import 'geoquiz_game_hangman_screen.dart';

class GeoQuizQuestionScreen extends GameScreen<GeoQuizGameContext>
    with QuizOptionsGameScreen<GeoQuizGameContext> {
  final GeoQuizCountryUtils _geoQuizCountryUtils = GeoQuizCountryUtils();

  GeoQuizQuestionScreen(
    GameScreenManagerState gameScreenManagerState, {
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
    initQuizOptionsScreen(
        gameContext, GeoQuizLocalStorage(), currentQuestionInfo,
        questionImage: getQuestionImage(category),
        buttonSkinConfig:
            ButtonSkinConfig(backgroundGradient: RadialGradient(radius: 4, colors: [
              ColorUtil.colorDarken(Colors.blue.shade100, 0.05),
              Colors.blue.shade600,
            ])),
        multipleCorrectAnswersButtonSkinConfig:
            ButtonSkinConfig(backgroundColor: Colors.purple.shade100));
  }

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return GeoQuizHangmanScreen.showInterstitialAdEveryNQuestions;
  }

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
          module: module,
          imageExtension: flagsOrMaps ? "png" : "jpg",
          imageName: imageName);
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
        widget.currentQuestionInfo.question, 2, 4, null);
    Widget optionsRows = widget.createOptionRows(
        setStateCallback, widget.goToNextGameScreenCallBack(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[questionContainer, optionsRows],
    );
  }

  void setStateCallback() {
    setState(() {});
  }
}
