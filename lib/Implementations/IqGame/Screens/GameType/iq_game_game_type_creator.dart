import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
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

  Widget createGameContainerWithDecoration(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1), BlendMode.dstATop),
            image: imageService.getSpecificAssetImage(
              imageName: "backgr_cat" +
                  gameContext.questionConfig.categories.first.index.toString(),
              imageExtension: "png",
            )),
      ),
      child: createGameContainer(context),
    );
  }

  Widget createGameContainer(BuildContext context);

  Widget createGameOverContainer(BuildContext context) {
    var margin = SizedBox(
      height: screenDimensionsService.h(5),
    );
    List<Widget> infoContainers = [];
    if (gameContext.gameUser.getAllQuestions([]).length ==
        gameContext.gameUser.getAllQuestions([QuestionInfoStatus.won]).length) {
      infoContainers.add(createMainGameOverInfoText(label.l_congratulations,
          Colors.lightGreenAccent.shade400, Colors.green.shade800));
      infoContainers.add(margin);
      infoContainers.add(margin);
      infoContainers.add(MyText(
          text: label.l_game_finished,
          fontConfig: FontConfig(
              fontWeight: FontWeight.w700,
              fontSize: FontConfig.getCustomFontSize(1.5),
              fontColor: Colors.black)));
      infoContainers.add(margin);
    } else {
      infoContainers.add(createMainGameOverInfoText(label.l_game_finished,
          Colors.lightGreenAccent.shade400, Colors.green.shade800));
      infoContainers.add(margin);
    }
    infoContainers.add(MyText(
        text:
            formatTextWithOneParam(label.l_score_param0, getScore().toString()),
        fontConfig: FontConfig(
            fontWeight: FontWeight.w700,
            fontSize: FontConfig.getCustomFontSize(1.8),
            fontColor: Colors.blue.shade800)));
    infoContainers.add(margin);
    infoContainers.add(margin);
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
          children: infoContainers,
        ));
  }

  bool isGameOverOnFirstWrongAnswer();

  int getScore();

  MyText createMainGameOverInfoText(
      String text, Color textColor, Color borderColor) {
    return MyText(
        text: text,
        fontConfig: FontConfig(
            fontWeight: FontWeight.w700,
            borderColor: borderColor,
            fontSize: FontConfig.getCustomFontSize(2),
            fontColor: textColor));
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

  bool showScore() {
    return true;
  }

  void answerQuestion(String answer, bool storeAnswersInStorage) {
    if (currentQuestionInfo.isQuestionOpen()) {
      bool isCorrectAnswer =
          gameContext.answerQuestion(currentQuestionInfo, answer);
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
    return createInfoMyText(
        (currentQuestionNr + 1).toString() + "/" + totalQuestions.toString(),
        1.2);
  }

  MyText createInfoMyText(String text, double fontSize) {
    return MyText(
        textShadow: Shadow(
          blurRadius: FontConfig.standardShadowRadius * 2,
          color: Colors.black.withOpacity(0.3),
        ),
        fontConfig: FontConfig(
            fontSize: FontConfig.getCustomFontSize(fontSize),
            fontColor: Colors.white,
            borderWidth: FontConfig.standardBorderWidth * 1.3,
            borderColor: Colors.black),
        text: text);
  }
}
