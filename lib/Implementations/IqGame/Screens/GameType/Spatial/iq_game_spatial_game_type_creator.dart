import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_rotate.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../iq_game_game_type_creator.dart';

class IqGameSpatialGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalOptions = 4;
  static const int totalQuestions = 10;
  static final IqGameSpatialGameTypeCreator singleton =
      IqGameSpatialGameTypeCreator.internal();

  factory IqGameSpatialGameTypeCreator() {
    return singleton;
  }

  IqGameSpatialGameTypeCreator.internal();

  @override
  Widget createGameContainer(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      IqGameContext gameContext,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen) {
    var question = currentQuestionInfo.question;
    var questionImgModule = getQuestionImageModuleName(gameContext);
    var imgHeight = screenDimensionsService.dimen(30);

    List<Widget> answRows = [];
    List<Widget> answImgList = [];
    var random = Random();
    for (int i = 0; i < totalOptions; i++) {
      var getQuestionCorrectAnswer =
          _getQuestionCorrectAnswer(question.rawString);
      Widget qContainer = RotationTransition(
        turns: AlwaysStoppedAnimation(
            currentQuestionInfo.isQuestionOpen() ? random.nextDouble() : 0),
        child: SizedBox(
          height: imgHeight,
          child: imageService.getSpecificImage(
              maxHeight: imgHeight,
              imageName: "q" +
                  _getQuestionNr(question.rawString).toString() +
                  (i == getQuestionCorrectAnswer ? "w" : "c"),
              imageExtension: "png",
              module: questionImgModule),
        ),
      );

      answImgList.add(MyButton(
          disabled: !currentQuestionInfo.isQuestionOpen(),
          disabledBackgroundColor: getQuestionCorrectAnswer == i
              ? Colors.green.shade300
              : currentQuestionInfo.pressedAnswers.isNotEmpty &&
                      i == currentQuestionInfo.pressedAnswers.first.parseToInt
                  ? Colors.red.shade300
                  : Colors.transparent,
          onClick: () {
            answerQuestion(
                currentQuestionInfo, i, gameContext, goToNextScreen, false);
            iqGameLocalStorage.setMaxScoreForCat(
                getGameTypeCategory(gameContext), getScore(gameContext) ?? 0);
          },
          size: Size(imgHeight * 1.5, imgHeight * 1.5),
          buttonSkinConfig: ButtonSkinConfig(
              buttonUnpressedShadowColor: Colors.transparent,
              buttonPressedShadowColor: Colors.blue.shade400.withOpacity(0.2),
              backgroundColor: Colors.transparent),
          customContent: AnimateRotate(
            toAnimateWidget: qContainer,
            rotationSpeed: currentQuestionInfo.isQuestionOpen()
                ? RotationSpeed.slow
                : RotationSpeed.stop,
          )));
      if (i == 1 || i == 3) {
        answRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: answImgList.toList(),
        ));
        answImgList = [];
      }
    }
    Column answerColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: answRows,
    );

    var margin = SizedBox(
      height: screenDimensionsService.h(2),
    );

    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createCurrentQuestionNr(
                _getQuestionNr(question.rawString), totalQuestions),
            margin,
            MyText(text: "Find the odd one out"),
            margin,
            answerColumn,
          ],
        ));
  }

  int _getQuestionNr(String rawString) {
    return rawString.split(":")[0].parseToInt;
  }

  int _getQuestionCorrectAnswer(String rawString) {
    return rawString.split(":")[1].parseToInt;
  }

  @override
  int? getScore(IqGameContext gameContext) {
    return gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);
  }

  @override
  Widget createGameOverContainer(
      BuildContext context, IqGameContext gameContext) {
    return Container();
  }

  @override
  bool canGoToNextQuestion(QuestionInfo currentQuestionInfo) {
    return !currentQuestionInfo.isQuestionOpen();
  }

  @override
  bool goToNextScreenOnlyOnNextButtonPress() {
    return true;
  }
}
