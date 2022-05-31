import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_fade_in_fade_out_text.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../Service/iq_game_local_storage.dart';
import '../iq_game_game_type_creator.dart';
import 'iq_game_memtest_question_service.dart';

class IqGameMemTestGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalQuestions = 10;
  static const int rows = 4;
  static const int columns = 4;
  IqGameMemTestGameTypeScreenState _memTestGameTypeScreenState =
      IqGameMemTestGameTypeScreenState.LOADING;
  Map<int, int> randomPosForBtns = {};
  List<int> answersToPress = [];

  @override
  void initGameTypeCreator(
    QuestionInfo currentQuestionInfo,
    IqGameContext gameContext,
    VoidCallback refreshScreen,
    VoidCallback goToNextScreen,
  ) {
    super.initGameTypeCreator(
        currentQuestionInfo, gameContext, refreshScreen, goToNextScreen);
    _memTestGameTypeScreenState = IqGameMemTestGameTypeScreenState.LOADING;
    randomPosForBtns =
        _createRandomPositionsForNumbers(currentQuestionInfo.question.index);
    answersToPress = randomPosForBtns.values.toList();
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

    var questionNr = question.index;
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
      int pos = 0;
      for (int col = 0; col < columns; col++) {
        for (int row = 0; row < rows; row++) {
          Widget cellWidget;
          if (randomPosForBtns.containsKey(pos)) {
            int btnVal = randomPosForBtns.get<int, int>(pos)!;
            var btnBackground = Colors.blue;
            cellWidget = MyButton(
              buttonAllPadding: btnPad,
              disabledBackgroundColor:
                  currentQuestionInfo.status == QuestionInfoStatus.won
                      ? Colors.green
                      : isAnswerCorrect(btnVal)
                          ? Colors.green
                          : !answersToPress.contains(btnVal)
                              ? btnBackground
                              : Colors.grey.shade500,
              touchable: _memTestGameTypeScreenState !=
                  IqGameMemTestGameTypeScreenState.SHOW_NUMBERS,
              disabled: !currentQuestionInfo.isQuestionOpen() ||
                  answersToPress.isEmpty,
              text: _memTestGameTypeScreenState ==
                          IqGameMemTestGameTypeScreenState.SHOW_NUMBERS ||
                      !answersToPress.contains(btnVal) ||
                      currentQuestionInfo.status == QuestionInfoStatus.lost
                  ? btnVal.toString()
                  : "",
              onClick: () {
                if (answersToPress.isNotEmpty) {
                  if (isAnswerCorrect(btnVal)) {
                    answersToPress.remove(btnVal);
                    if (answersToPress.isEmpty) {
                      answerQuestion(
                          currentQuestionInfo,
                          IqGameMemTestQuestionService
                              .allAnswersPressedCorrectly,
                          gameContext,
                          refreshScreen,
                          false);
                      iqGameLocalStorage.setScoreForCat(IqGameScoreInfo(
                          getGameTypeCategory(gameContext).name,
                          getScore(gameContext) ?? 0,
                          DateTime.now()));
                    } else {
                      refreshScreen.call();
                    }
                  } else {
                    answerQuestion(
                        currentQuestionInfo,
                        IqGameMemTestQuestionService
                            .notAllAnswersPressedCorrectly,
                        gameContext,
                        refreshScreen,
                        false);
                  }
                }
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
                  backgroundColor: btnBackground),
            );
          } else {
            cellWidget = SizedBox(
              width: btnSideDimen + btnPad * 2,
              height: btnSideDimen + btnPad * 2,
            );
          }
          answImgList.add(cellWidget);
          pos++;
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
            createCurrentQuestionNr(questionNr, totalQuestions),
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

  bool isAnswerCorrect(int answer) {
    return answer == answersToPress.reduce(min);
  }

  List<int> _getNrOfItemsForLevel(int qNr) {
    List<int> currentAvailableNrs = [];
    int maxInitNumber = 3;
    for (int i = 1; i <= maxInitNumber; i++) {
      currentAvailableNrs.add(i);
    }
    for (int i = 1; i <= qNr; i++) {
      currentAvailableNrs.add(i + maxInitNumber);
    }
    return currentAvailableNrs;
  }

  Map<int, int> _createRandomPositionsForNumbers(int qNr) {
    Map<int, int> map = {};
    Random random = Random();
    int totalCells = columns * rows;
    var nrOfItemsForLevel = _getNrOfItemsForLevel(qNr);
    for (int nr in nrOfItemsForLevel) {
      int randPos = random.nextInt(totalCells);
      while (map.containsKey(randPos)) {
        randPos = random.nextInt(totalCells);
      }
      map.putIfAbsent(randPos, () => nr);
    }
    return map;
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
