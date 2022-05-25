import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_fade_in_fade_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../iq_game_game_type_creator.dart';

class IqGameMemTestGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalQuestions = 10;
  static const int rows = 4;
  static const int columns = 4;
  static final IqGameMemTestGameTypeCreator singleton =
      IqGameMemTestGameTypeCreator.internal();
  IqGameMemTestGameTypeScreenState _memTestGameTypeScreenState =
      IqGameMemTestGameTypeScreenState.LOADING;

  factory IqGameMemTestGameTypeCreator() {
    return singleton;
  }

  IqGameMemTestGameTypeCreator.internal();

  @override
  void initGameTypeCreator() {
    _memTestGameTypeScreenState = IqGameMemTestGameTypeScreenState.LOADING;
  }

  @override
  Widget createGameContainer(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      IqGameContext gameContext,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen) {
    var question = currentQuestionInfo.question;
    var margin = SizedBox(
      height: screenDimensionsService.h(2),
    );
    Widget mainContent;

    var durationEye = 2000;
    var durationShowNr = 1000;
    if (_memTestGameTypeScreenState !=
        IqGameMemTestGameTypeScreenState.HIDE_NUMBERS) {
      Future.delayed(
          Duration(
              milliseconds: _memTestGameTypeScreenState ==
                      IqGameMemTestGameTypeScreenState.LOADING
                  ? durationEye
                  : durationShowNr), () {
        _memTestGameTypeScreenState = _memTestGameTypeScreenState ==
                IqGameMemTestGameTypeScreenState.SHOW_NUMBERS
            ? IqGameMemTestGameTypeScreenState.HIDE_NUMBERS
            : IqGameMemTestGameTypeScreenState.SHOW_NUMBERS;
        refreshScreen.call();
      });
    }

    if (_memTestGameTypeScreenState ==
        IqGameMemTestGameTypeScreenState.LOADING) {
      mainContent = AnimateFadeInFadeOut(
        onlyFadeOut: true,
        duration: Duration(milliseconds: durationEye),
        toAnimateWidget: imageService.getSpecificImage(
            imageName: "eye",
            imageExtension: "png",
            maxHeight: screenDimensionsService.dimen(50)),
      );
    } else {
      var btnSideDimen = screenDimensionsService.dimen(17);
      var btnPad = screenDimensionsService.dimen(1);

      List<Widget> answRows = [];
      List<Widget> answImgList = [];
      var random = Random();
      for (int col = 0; col < columns; col++) {
        for (int row = 0; row < rows; row++) {
          answImgList.add(MyButton(
            buttonAllPadding: btnPad,
            disabled: !currentQuestionInfo.isQuestionOpen(),
            text: _memTestGameTypeScreenState ==
                    IqGameMemTestGameTypeScreenState.SHOW_NUMBERS
                ? col.toString()
                : "",
            onClick: () {
              answerQuestion(
                  currentQuestionInfo, col, gameContext, refreshScreen, false);
              iqGameLocalStorage.setMaxScoreForCat(
                  getGameTypeCategory(gameContext), getScore(gameContext) ?? 0);
            },
            fontConfig: FontConfig(
                fontWeight: FontWeight.w700,
                borderColor: Colors.black,
                fontSize: FontConfig.getCustomFontSize(1.3),
                fontColor: Colors.white),
            size: Size(btnSideDimen, btnSideDimen),
            buttonSkinConfig: ButtonSkinConfig(
                borderRadius: FontConfig.standardBorderRadius * 1.0,
                borderColor: Colors.black,
                backgroundColor: Colors.blue),
          ));
        }
        answRows.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: answImgList.toList(),
        ));
        answImgList = [];
      }
      mainContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: answRows,
      );
    }

    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createCurrentQuestionNr(question.index + 1, totalQuestions),
            margin,
            MyText(text: "Find the odd one out"),
            margin,
            SizedBox(
              height: screenDimensionsService.h(50),
              child: mainContent,
            )
          ],
        ));
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
  bool hasGoToNextQuestionBtn(QuestionInfo currentQuestionInfo) {
    return !currentQuestionInfo.isQuestionOpen();
  }
}

enum IqGameMemTestGameTypeScreenState { LOADING, SHOW_NUMBERS, HIDE_NUMBERS }
