import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_number_seq_answer_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../../Game/Question/Model/question.dart';
import '../../../../../Lib/Button/button_skin_config.dart';
import '../../../../../Lib/Color/color_util.dart';
import '../../../../../Lib/Font/font_config.dart';
import '../../../../../Lib/Popup/my_popup.dart';
import '../iq_game_game_type_creator.dart';

class IqGameNumberSeqGameTypeCreator extends IqGameGameTypeCreator {
  String? pressedNumbers;

  IqGameNumberSeqGameTypeCreator(IqGameContext gameContext)
      : super(gameContext);

  @override
  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshScreen,
      required VoidCallback goToNextScreen,
      required VoidCallback goToGameOverScreen}) {
    super.initGameTypeCreator(currentQuestionInfo,
        refreshScreen: refreshScreen,
        goToNextScreen: goToNextScreen,
        goToGameOverScreen: goToGameOverScreen);
    resetPressedNumbers();
  }

  @override
  Widget createGameContainer(
    BuildContext context,
  ) {
    var question = currentQuestionInfo.question;

    var heightMargin = SizedBox(
      height: screenDimensionsService.h(2),
    );

    List<Widget> answRows = [];
    List<Widget> answImgList = [];

    var btnSizeDimen = getBtnSizeDimen();
    var btnPad = screenDimensionsService.dimen(2);
    for (int i = 0; i <= 9; i++) {
      answImgList.add(MyButton(
        disabled: !currentQuestionInfo.isQuestionOpen(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        createCurrentQuestionNr(
            question.index, gameContext.questionConfig.amountOfQuestions),
        heightMargin,
        MyText(
            text: "Find the unknown number in the sequence",
            fontConfig:
                FontConfig(borderColor: Colors.black, fontColor: Colors.white)),
        heightMargin,
        imageService.getSpecificImage(
            imageName: "q" + question.index.toString(),
            imageExtension: "jpg",
            maxWidth: screenDimensionsService.w(90),
            maxHeight: screenDimensionsService.h(40),
            module: getQuestionImageModuleName(gameContext)),
        SizedBox(
            height: btnSizeDimen + btnPad * 2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  createSubmitClearBtn(context, btnPad, gameContext,
                      currentQuestionInfo, null, refreshScreen, goToNextScreen),
                  horizMargin,
                  SizedBox(
                      width: screenDimensionsService.dimen(40),
                      child: MyText(
                          text: pressedNumbers ?? "",
                          fontConfig: FontConfig(
                              fontWeight: FontWeight.w700,
                              borderColor: Colors.black,
                              fontSize: FontConfig.getCustomFontSize(1.3),
                              fontColor: Colors.white))),
                  horizMargin,
                  createSubmitClearBtn(
                      context,
                      btnPad,
                      gameContext,
                      currentQuestionInfo,
                      imageService.getSpecificImage(
                          imageName: "q" + question.index.toString() + "_a",
                          imageExtension: "jpg",
                          maxWidth: screenDimensionsService.w(80),
                          maxHeight: screenDimensionsService.h(30),
                          module: getQuestionImageModuleName(gameContext)),
                      refreshScreen,
                      goToNextScreen),
                ])),
        heightMargin,
        answerColumn,
      ],
    );
  }

  double getBtnSizeDimen() => screenDimensionsService.dimen(14);

  Widget createSubmitClearBtn(
      BuildContext context,
      double btnPad,
      IqGameContext gameContext,
      QuestionInfo currentQuestionInfo,
      Widget? qImage,
      VoidCallback refreshScreen,
      VoidCallback goToNextScreen) {
    var btnSizeDimen = getBtnSizeDimen();
    var isClearBtn = qImage == null;
    return pressedNumbers == null || !currentQuestionInfo.isQuestionOpen()
        ? Container()
        : MyButton(
            buttonSkinConfig: ButtonSkinConfig(
                image: (imageService.getSpecificImage(
                    imageName: isClearBtn ? "btn_delete" : "btn_submit",
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
              if (isClearBtn) {
                resetPressedNumbers();
                refreshScreen.call();
              } else {
                answerQuestion(pressedNumbers!.parseToInt, true);
                MyPopup.showPopup(
                    context,
                    IqGameIqNumberSeqAnswerPopup(
                        currentQuestionInfo,
                        qImage!,
                        currentQuestionInfo.question.correctAnswers.first,
                        pressedNumbers ?? "",
                        goToNextScreen,
                        false));
                resetPressedNumbers();
              }
            },
            size: Size(btnSizeDimen, btnSizeDimen),
          );
  }

  void resetPressedNumbers() {
    pressedNumbers = null;
  }

  @override
  int getScore() {
    return gameContext.gameUser.countAllQuestions([QuestionInfoStatus.won]);
  }

  @override
  bool hasSkipButton() {
    return true;
  }

  @override
  bool isGameOverOnFirstWrongAnswer() {
    return false;
  }

  @override
  Color getBackgroundColor(Question question) {
    return ColorUtil.hexToColor('#' + question.rawString.split("###")[1]);
  }
}
