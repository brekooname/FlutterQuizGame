import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/ScreenDimensions/screen_dimensions_service.dart';

import '../../../../Game/Question/Model/question.dart';
import '../../../../Game/Question/Model/question_info.dart';
import '../../../../Lib/Color/color_util.dart';
import '../../../../Lib/Font/font_config.dart';
import '../../../../Lib/Text/my_text.dart';
import '../../Questions/iq_game_context.dart';

abstract class IqGameGameTypeCreator {
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();
  ImageService imageService = ImageService();
  ScreenDimensionsService screenDimensionsService = ScreenDimensionsService();

  void initGameTypeCreator() {}

  Widget createGameContainer(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      IqGameContext gameContext,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen);

  Widget createGameOverContainer(
      BuildContext context, IqGameContext gameContext);

  bool goToNextScreenOnlyOnNextButtonPress() {
    return false;
  }

  int? getScore(IqGameContext gameContext) {
    return null;
  }

  bool canGoToNextQuestion(QuestionInfo currentQuestionInfo) {
    return false;
  }

  void answerQuestion(
      QuestionInfo questionInfo,
      int answer,
      IqGameContext gameContext,
      VoidCallback goToNextScreen,
      bool storeAnswersInStorage) {
    if (questionInfo.isQuestionOpen()) {
      gameContext.answerQuestion(questionInfo, answer.toString());
      if (storeAnswersInStorage) {
        _storeCurrentAnswers(gameContext);
      }
      goToNextScreen.call();
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
    return ColorUtil.hexToColor('#' + question.rawString.split("###")[1]);
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
