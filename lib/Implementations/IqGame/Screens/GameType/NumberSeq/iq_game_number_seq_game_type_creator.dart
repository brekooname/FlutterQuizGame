import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../../Lib/Button/button_skin_config.dart';
import '../../../../../Lib/Font/font_config.dart';
import '../iq_game_game_type_creator.dart';

class IqGameNumberSeqGameTypeCreator extends IqGameGameTypeCreator {
  static final IqGameNumberSeqGameTypeCreator singleton =
      IqGameNumberSeqGameTypeCreator.internal();

  factory IqGameNumberSeqGameTypeCreator() {
    return singleton;
  }

  IqGameNumberSeqGameTypeCreator.internal();

  String? pressedNumbers;

  @override
  void initGameTypeCreator() {
    resetPressedNumbers();
  }

  @override
  Widget createGameContainer(
      QuestionInfo currentQuestionInfo,
      IqGameContext gameContext,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen) {
    var question = currentQuestionInfo.question;
    var questionImgModule = getQuestionImageModuleName(gameContext);

    var imgWidth = screenDimensionsService.w(90);
    var imgHeight = screenDimensionsService.h(40);
    var leftMargin = (screenDimensionsService.w(100) - imgWidth) / 2;
    var questionImg = imageService.getSpecificImage(
        imageName: "q" + currentQuestionInfo.question.index.toString(),
        imageExtension: "png",
        maxWidth: imgWidth,
        maxHeight: imgHeight,
        module: questionImgModule);

    List<Widget> stackChildren = [];
    stackChildren.add(questionImg);
    var qInfo = currentQuestionInfo.question.rawString.split(",");
    var questionMarkDimen = screenDimensionsService.w(10);
    var img = 
    stackChildren.add(Positioned(
        top: (qInfo[3].split("###")[0].parseToDouble / 100) * imgHeight -
            questionMarkDimen / 2,
        left: (qInfo[2].parseToDouble / 100) * imgWidth - leftMargin,
        child: imageService.getSpecificImage(
            imageName: "btn_submit",
            imageExtension: "png",
            maxHeight: questionMarkDimen,
            maxWidth: questionMarkDimen,
            module: "buttons")));

    AnimateZoomInZoomOut(
                toAnimateWidgetSize: answerBtnSize,
                zoomInZoomOutOnce: true,Stack stack = Stack(
                duration: Duration(milliseconds: millisForZoomInZoomOut),  alignment: Alignment.center,
                toAnimateWidget: answerBtn,  children: stackChildren,
              ));

    var heightMargin = SizedBox(
      height: screenDimensionsService.h(2),
    );

    List<Widget> answRows = [];
    List<Widget> answImgList = [];

    var btnSizeDimen = getBtnSizeDimen();
    var btnPad = screenDimensionsService.dimen(2);
    for (int i = 0; i <= 9; i++) {
      answImgList.add(MyButton(
        buttonAllPadding: btnPad,
        fontConfig: FontConfig(
            fontWeight: FontWeight.w700,
            fontSize: FontConfig.getCustomFontSize(1.1),
            fontColor: Colors.black),
        text: i.toString(),
        onClick: () {
          if ((pressedNumbers ?? "").length < 5) {
            pressedNumbers = (pressedNumbers ?? "") + i.toString();
            refreshScreen.call();
          }
        },
        size: Size(btnSizeDimen, btnSizeDimen),
      ));
      if (i == 4 || i == 9) {
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

    var horizMargin = SizedBox(width: screenDimensionsService.dimen(2));
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createCurrentQuestionNr(
                question.index, gameContext.questionConfig.amountOfQuestions),
            heightMargin,
            MyText(text: "Find the unknown number in the sequence"),
            heightMargin,
            stack,
            SizedBox(
                height: btnSizeDimen + btnPad * 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      createSubmitClearBtn(btnPad, true, refreshScreen),
                      horizMargin,
                      MyText(text: pressedNumbers ?? ""),
                      horizMargin,
                      createSubmitClearBtn(btnPad, false, refreshScreen),
                    ])),
            heightMargin,
            answerColumn,
          ],
        ));
  }

  double getBtnSizeDimen() => screenDimensionsService.dimen(14);

  Widget createSubmitClearBtn(
      double btnPad, bool clearBtn, VoidCallback refreshScreen) {
    var btnSizeDimen = getBtnSizeDimen();
    return pressedNumbers == null
        ? Container()
        : MyButton(
            buttonSkinConfig: ButtonSkinConfig(
                image: (imageService.getSpecificImage(
                    imageName: clearBtn ? "btn_delete" : "btn_submit",
                    imageExtension: "png",
                    module: "buttons",
                    maxWidth: btnSizeDimen,
                    maxHeight: btnSizeDimen))),
            buttonAllPadding: btnPad,
            fontConfig: FontConfig(
                fontWeight: FontWeight.w700,
                fontSize: FontConfig.getCustomFontSize(1.1),
                fontColor: Colors.black),
            onClick: () {
              resetPressedNumbers();
              refreshScreen.call();
            },
            size: Size(btnSizeDimen, btnSizeDimen),
          );
  }

  void resetPressedNumbers() {
    pressedNumbers = null;
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
