import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Components/iq_game_number_seq_answer_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import '../../../../../Game/Question/Model/question.dart';
import '../../../../../Lib/Button/button_skin_config.dart';
import '../../../../../Lib/Color/color_util.dart';
import '../../../../../Lib/Font/font_config.dart';
import '../../../../../Lib/Popup/my_popup.dart';
import '../../../../../main.dart';
import '../iq_game_game_type_creator.dart';

class IqGameNumberSeqGameTypeCreator extends IqGameGameTypeCreator {
  String? pressedNumbers;

  IqGameNumberSeqGameTypeCreator(IqGameContext gameContext)
      : super(gameContext);

  @override
  void initGameTypeCreator(QuestionInfo currentQuestionInfo,
      {required VoidCallback refreshState,
      required VoidCallback restartCurrentScreenAfterExtraContentPurchase,
      required VoidCallback goToNextScreen,
      required VoidCallback goToGameOverScreen}) {
    super.initGameTypeCreator(currentQuestionInfo,
        refreshState: refreshState,
        restartCurrentScreenAfterExtraContentPurchase: restartCurrentScreenAfterExtraContentPurchase,
        goToNextScreen: goToNextScreen,
        goToGameOverScreen: goToGameOverScreen);
    resetPressedNumbers();
  }

  @override
  Widget createGameContainerWithDecoration(BuildContext context) {
    return createGameContainer(context);
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
            refreshState.call();
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
        createInfoMyText(
            label.l_find_the_missing_number_in_this_numerical_sequence, 1.0),
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
                  createSubmitClearBtn(context, true, btnPad, gameContext,
                      currentQuestionInfo, refreshState),
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
                  createSubmitClearBtn(context, false, btnPad, gameContext,
                      currentQuestionInfo, refreshState),
                ])),
        heightMargin,
        answerColumn,
      ],
    );
  }

  Image _getQuestionImage(Question question) {
    return imageService.getSpecificImage(
        imageName: "q" + question.index.toString() + "_a",
        imageExtension: "jpg",
        maxWidth: screenDimensionsService.w(80),
        maxHeight: screenDimensionsService.h(30),
        module: getQuestionImageModuleName(gameContext));
  }

  double getBtnSizeDimen() => screenDimensionsService.dimen(14);

  Widget createSubmitClearBtn(
      BuildContext context,
      bool isClearBtn,
      double btnPad,
      IqGameContext gameContext,
      QuestionInfo currentQuestionInfo,
      VoidCallback refreshScreen) {
    var btnSizeDimen = getBtnSizeDimen();
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
                answerQuestion(pressedNumbers!, true);
                showExplanationPopup();
                resetPressedNumbers();
              }
            },
            size: Size(btnSizeDimen, btnSizeDimen),
          );
  }

  void showExplanationPopup() {
    return MyPopup.showPopup(IqGameIqNumberSeqAnswerPopup(
        currentQuestionInfo,
        _getQuestionImage(currentQuestionInfo.question),
        currentQuestionInfo.question.correctAnswers.first,
        pressedNumbers ?? "",
        goToNextScreen,
        restartCurrentScreenAfterExtraContentPurchase,
        !MyApp.isExtraContentLocked));
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
