import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Animation/animation_fade_in_fade_out.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/map_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';

import '../iq_game_game_type_creator.dart';
import 'iq_game_memtest_question_service.dart';

class IqGameMemTestGameTypeCreator extends IqGameGameTypeCreator {
  static const int totalQuestions = 10;
  static const int rows = 4;
  static const int columns = 4;
  IqGameMemTestGameTypeScreenState _memTestGameTypeScreenState =
      IqGameMemTestGameTypeScreenState.loading;
  Map<int, int> randomPosForBtns = {};
  List<int> answersToPress = [];

  IqGameMemTestGameTypeCreator(IqGameContext gameContext) : super(gameContext);

  @override
  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshScreen,
      required VoidCallback goToNextScreen,
      required VoidCallback goToGameOverScreen}) {
    super.initGameTypeCreator(currentQuestionInfo,
        refreshScreen: refreshScreen,
        goToNextScreen: goToNextScreen,
        goToGameOverScreen: goToGameOverScreen);
    _memTestGameTypeScreenState = IqGameMemTestGameTypeScreenState.loading;
    randomPosForBtns =
        _createRandomPositionsForNumbers(currentQuestionInfo.question.index);
    answersToPress = randomPosForBtns.values.toList();
  }

  @override
  Widget createGameContainer(
    BuildContext context,
  ) {
    var question = currentQuestionInfo.question;
    var margin = SizedBox(
      height: screenDimensionsService.h(2),
    );
    Widget mainContent;

    var questionNr = question.index;
    var durationEye = 2000;
    var durationShowNr = 1000;
    if (_memTestGameTypeScreenState !=
        IqGameMemTestGameTypeScreenState.hideNumbers) {
      Future.delayed(
          Duration(
              milliseconds: _memTestGameTypeScreenState ==
                      IqGameMemTestGameTypeScreenState.loading
                  ? durationEye
                  : durationShowNr), () {
        _memTestGameTypeScreenState = _memTestGameTypeScreenState ==
                IqGameMemTestGameTypeScreenState.showNumbers
            ? IqGameMemTestGameTypeScreenState.hideNumbers
            : IqGameMemTestGameTypeScreenState.showNumbers;
        refreshScreen.call();
      });
    }

    if (_memTestGameTypeScreenState ==
        IqGameMemTestGameTypeScreenState.loading) {
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
                  IqGameMemTestGameTypeScreenState.showNumbers,
              disabled: !currentQuestionInfo.isQuestionOpen() ||
                  answersToPress.isEmpty,
              text: _memTestGameTypeScreenState ==
                          IqGameMemTestGameTypeScreenState.showNumbers ||
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
                          IqGameMemTestQuestionService
                              .allAnswersPressedCorrectly
                              .toString(),
                          false);
                      Future.delayed(
                          Duration(
                              seconds: currentQuestionInfo.status ==
                                      QuestionInfoStatus.won
                                  ? 1
                                  : 2), () {
                        goToNextScreen.call();
                      });
                    } else {
                      refreshScreen.call();
                    }
                  } else {
                    answerQuestion(
                        IqGameMemTestQuestionService
                            .notAllAnswersPressedCorrectly
                            .toString(),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createCurrentQuestionNr(questionNr, totalQuestions),
        margin,
        createInfoMyText(label.l_select_the_numbers_in_ascending_order, 1.0),
        margin,
        SizedBox(
          height: screenDimensionsService.h(50),
          width: screenDimensionsService.w(100),
          child: Container(child: mainContent),
        )
      ],
    );
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
  int getScore() {
    return gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);
  }

  @override
  bool isGameOverOnFirstWrongAnswer() {
    return true;
  }
}

enum IqGameMemTestGameTypeScreenState { loading, showNumbers, hideNumbers }
