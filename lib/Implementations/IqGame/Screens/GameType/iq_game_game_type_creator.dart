import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../../Game/Question/Model/question.dart';
import '../../../../Game/Question/Model/question_info.dart';
import '../../../../Lib/Font/font_config.dart';
import '../../../../Lib/Text/my_text.dart';
import '../../Questions/iq_game_context.dart';

abstract class IqGameGameTypeCreator with LabelMixin {
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();
  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensionsService = ScreenDimensionsService();

  late VoidCallback refreshScreen;
  late VoidCallback goToNextScreen;
  late VoidCallback goToGameOverScreen;
  late QuestionInfo currentQuestionInfo;
  IqGameContext gameContext;

  IqGameGameTypeCreator(this.gameContext);

  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshScreen,
      required VoidCallback goToNextScreen,
      required VoidCallback goToGameOverScreen}) {
    this.currentQuestionInfo = currentQuestionInfo;
    this.refreshScreen = refreshScreen;
    this.goToNextScreen = goToNextScreen;
    this.goToGameOverScreen = goToGameOverScreen;
  }

  void initGameOverTypeCreator(
      {required VoidCallback refreshScreen,
      required VoidCallback goToGameOverScreen}) {
    this.refreshScreen = refreshScreen;
    this.goToGameOverScreen = goToGameOverScreen;
  }

  Widget createGameContainer(BuildContext context);

  Widget createGameOverContainer(BuildContext context) {
    // if (gameContext.gameUser.getAllQuestions([]).length ==
    //     gameContext.gameUser.getAllQuestions([QuestionInfoStatus.won]).length) {
    return createGameFinishedSuccessfullyContainer();
    // } else {
    //   return Container();
    // }
  }

  bool isGameOverOnFirstWrongAnswer();

  int getScore();

  Widget createGameFinishedSuccessfullyContainer() {
    var margin = SizedBox(
      height: screenDimensionsService.h(5),
    );
    return Container(
        height: screenDimensionsService.h(80),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.175), BlendMode.dstATop),
              image: imageService.getMainAssetImage(
                imageName: "popup_rate_app_stars_background",
                imageExtension: "png",
                module: "popup",
              )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
                text: label.l_congratulations,
                fontConfig: FontConfig(
                    fontWeight: FontWeight.w700,
                    borderColor: Colors.green.shade800,
                    fontSize: FontConfig.getCustomFontSize(2),
                    fontColor: Colors.lightGreenAccent.shade400)),
            margin,
            margin,
            MyText(
                text: "Game finished successfully",
                fontConfig: FontConfig(
                    fontWeight: FontWeight.w700,
                    fontSize: FontConfig.getCustomFontSize(1.5),
                    fontColor: Colors.black)),
            margin,
            MyText(
                text: formatTextWithOneParam(
                    label.l_score_param0, getScore().toString()),
                fontConfig: FontConfig(
                    fontWeight: FontWeight.w700,
                    fontSize: FontConfig.getCustomFontSize(1.8),
                    fontColor: Colors.blue.shade800)),
            margin,
            margin,
          ],
        ));
  }

  bool hasGoToNextQuestionBtn() {
    return false;
  }

  void disposeGameTypeCreator() {}

  bool hasSkipButton() {
    return false;
  }

  void executeOnGameOver() {
    iqGameLocalStorage.setScoreForCat(IqGameScoreInfo(
        getGameTypeCategory(gameContext).name, getScore(), DateTime.now()));
  }

  bool showScore(){
    return true;
  }

  void answerQuestion(int answer, bool storeAnswersInStorage) {
    if (currentQuestionInfo.isQuestionOpen()) {
      bool isCorrectAnswer =
          gameContext.answerQuestion(currentQuestionInfo, answer.toString());
      if (storeAnswersInStorage) {
        _storeCurrentAnswers(gameContext);
      }
      if (gameContext.gameUser.getOpenQuestions().isEmpty) {
        iqGameLocalStorage
            .putAnsweredQuestions({}, getGameTypeCategory(gameContext));
      }
      refreshScreen.call();
      if (!isCorrectAnswer && isGameOverOnFirstWrongAnswer()) {
        Future.delayed(const Duration(seconds: 1), () {
          goToGameOverScreen.call();
        });
      }
    }
  }

  void _storeCurrentAnswers(IqGameContext gameContext) {
    Map<String, List<String>> answers = {};
    for (QuestionInfo info in gameContext.gameUser.getAllQuestions([])) {
      if (!info.isQuestionOpen()) {
        answers.putIfAbsent(
            info.question.index.toString(), () => info.pressedAnswers.toList());
      }
    }
    iqGameLocalStorage.putAnsweredQuestions(
        answers, getGameTypeCategory(gameContext));
  }

  String getQuestionImageModuleName(IqGameContext gameContext) {
    return "cat" + getGameTypeCategory(gameContext).index.toString();
  }

  QuestionCategory getGameTypeCategory(IqGameContext gameContext) =>
      gameContext.questionConfig.categories.first;

  Color getBackgroundColor(Question question) {
    return Colors.white;
  }

  MyText createCurrentQuestionNr(int currentQuestionNr, int totalQuestions) {
    return MyText(
        fontConfig: FontConfig(
            fontSize: FontConfig.getCustomFontSize(1.2),
            fontColor: Colors.white,
            borderWidth: FontConfig.standardBorderWidth * 1.3,
            borderColor: Colors.black),
        text: (currentQuestionNr + 1).toString() +
            "/" +
            totalQuestions.toString());
  }
}
