import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_attr_description_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameTypeBigFive extends PersTestGameType {
  final int _gameOverMaxScoreVal = 40;

  PersTestGameTypeBigFive(
      CampaignLevel campaignLevel,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState)
      : super(campaignLevel, currentQuestionInfo, gameContext,
            gameScreenManagerState);

  @override
  Widget createGamePlayContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PersTestLevelHeader(
            (currentQuestionInfo.question.index + 1).toString() +
                "/" +
                gameContext.gameUser.countAllQuestions([]).toString()),
        const Spacer(),
        createQuestionContainer(),
        SizedBox(height: screenDimensions.dimen(10)),
        createResponseLabels(),
        createResponseButtons(),
        const Spacer(),
      ],
    );
  }

  Widget createQuestionContainer() {
    List<Widget> children = [];
    children.add(createPreviousNextButton(true));
    children.add(SizedBox(
        child: MyText(
      width: screenDimensions.w(75),
      maxLines: 4,
      fontSize: FontConfig.bigFontSize,
      text: currentQuestionInfo.question.rawString,
    )));
    children.add(createPreviousNextButton(false));
    return SizedBox(
        height: screenDimensions.dimen(30),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children));
  }

  Widget createPreviousNextButton(bool goPreviousQuestion) {
    var btnSideDimen = screenDimensions.dimen(12);
    var currentQIndex = currentQuestionInfo.question.index;
    return SizedBox(
        width: btnSideDimen,
        child: MyButton(
          visible: goPreviousQuestion && currentQIndex != 0 ||
              !goPreviousQuestion &&
                  currentQIndex !=
                      gameContext.gameUser.countAllQuestions([]) - 1 &&
                  currentQuestionInfo.status == QuestionInfoStatus.won,
          onClick: () {
            QuestionInfo goToQuestion = gameContext.gameUser
                .getAllQuestions([])
                .where((e) =>
                    e.question.index ==
                    (goPreviousQuestion
                        ? currentQIndex - 1
                        : currentQIndex + 1))
                .first;
            goToQuestionInfo(goToQuestion);
          },
          size: Size(btnSideDimen, btnSideDimen),
          buttonSkinConfig: ButtonSkinConfig(
              image: imageService.getSpecificImage(
                  module: "buttons",
                  imageName: goPreviousQuestion ? "left_arrow" : "right_arrow",
                  imageExtension: "png")),
        ));
  }

  Widget createResponseLabels() {
    List<Widget> labels = [];
    var labelWidth = screenDimensions.dimen(55);
    for (String l in ["Disagree", "Neutral", "Agree"]) {
      labels.add(SizedBox(
          width: labelWidth,
          child: MyText(
            textColor: Colors.grey.shade600,
            text: l,
          )));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: labels,
    );
  }

  Widget createResponseButtons() {
    var responseBtns = [
      ResponseButton(Colors.red, 0),
      ResponseButton(Colors.orange, 1),
      ResponseButton(Colors.yellow, 2),
      ResponseButton(ColorUtil.colorDarken(Colors.lightGreenAccent, 0.1), 3),
      ResponseButton(Colors.green, 4)
    ];
    var btnSideDimen = screenDimensions.dimen(20);
    List<Widget> btns = [];
    var pad = screenDimensions.dimen(4);
    for (ResponseButton r in responseBtns) {
      List<Widget> stackBtn = [];
      stackBtn.add(MyButton(
        onClick: () {
          currentQuestionInfo.clearPressedAnswers();
          currentQuestionInfo.addPressedAnswer(r.value.toString());
          gameContext.gameUser.setWonQuestion(currentQuestionInfo);
          goToQuestionInfo(gameContext.gameUser.getOpenQuestions().isEmpty
              ? null
              : gameContext.gameUser.getOpenQuestions().first);
        },
        size: Size(btnSideDimen, btnSideDimen),
        buttonSkinConfig: ButtonSkinConfig(
            borderRadius: FontConfig.standardBorderRadius * 4,
            backgroundColor: currentQuestionInfo.isQuestionOpen()
                ? r.color
                : ColorUtil.colorDarken(r.color, -0.15)),
      ));
      if (currentQuestionInfo.status == QuestionInfoStatus.won &&
          currentQuestionInfo.pressedAnswers.first == r.value.toString()) {
        stackBtn.add(
          imageService.getSpecificImage(
              imageName: "check",
              module: "buttons",
              imageExtension: "png",
              maxWidth: btnSideDimen / 1.5),
        );
      }
      btns.add(Padding(
          padding: EdgeInsets.all(pad),
          child: Stack(
            alignment: Alignment.center,
            children: stackBtn,
          )));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: btns,
    );
  }

  void goToQuestionInfo(QuestionInfo? questionInfo) {
    if (questionInfo == null) {
      gameScreenManagerState.showGameOverScreen(
          gameContext, campaignLevel.difficulty, campaignLevel.categories.first);
    } else {
      gameContext.currentQuestionInfo = questionInfo;
      gameScreenManagerState.showNextGameScreen(campaignLevel, gameContext);
    }
  }

  @override
  Widget createGameOverContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [MyBackButton(), const Spacer()]),
        const Spacer(),
        createAttributes(context),
        SizedBox(
          height: screenDimensions.dimen(1),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageService.getMainImage(
                  maxWidth: screenDimensions.dimen(8),
                  imageName: "info",
                  module: "general",
                  imageExtension: "png"),
              SizedBox(
                width: screenDimensions.dimen(1),
              ),
              MyText(
                text: "Click on any of the traits to see it's description",
              )
            ]),
        const Spacer(),
      ],
    );
  }

  int r(int qNr) {
    return Random().nextInt(5) + 1;
    return gameContext.gameUser
            .getAllQuestions([])
            .where((element) => element.question.index == qNr)
            .first
            .pressedAnswers
            .first
            .parseToInt +
        1;
  }

  Widget createAttributes(BuildContext context) {
    var persAttrList = [
      PersAttribute(Colors.lightGreenAccent, "Extroversion", calculateE()),
      PersAttribute(Colors.red, "Emotional stabielt", calculateA()),
      PersAttribute(Colors.tealAccent, "Agreeablesnn", calculateC()),
      PersAttribute(Colors.purpleAccent, "Consitoniouss", calculateN()),
      PersAttribute(Colors.blue, "Intellect/Imagination", calculateO()),
    ];
    List<Widget> attrs = [];
    var attrBarWidth = screenDimensions.dimen(90);
    var btnSize = Size(screenDimensions.dimen(90), screenDimensions.dimen(13));
    var padding = screenDimensions.dimen(0.8);
    for (PersAttribute r in persAttrList) {
      double percent = r.val / _gameOverMaxScoreVal * 100;
      attrs.add(Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyButton(
                onClick: () {
                  Future.delayed(
                      Duration.zero,
                      () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PersTestAttrDescriptionPopup();
                          }));
                },
                textMaxLines: 1,
                text: r.label,
                size: btnSize,
                fontConfig:
                    FontConfig(fontSize: FontConfig.getCustomFontSize(0.9)),
                buttonSkinConfig: ButtonSkinConfig(
                    backgroundColor: Colors.lightBlueAccent.shade200,
                    borderRadius: FontConfig.standardBorderRadius / 2),
              ),
              Stack(alignment: Alignment.center, children: [
                ProgressBar(
                    fillBarColor: r.color,
                    startNr: 0,
                    endNr: percent.toInt(),
                    totalNr: 100,
                    width: attrBarWidth,
                    height: btnSize.height),
                MyText(
                  text: percent.toInt().toString() + "%",
                  fontConfig: FontConfig(
                    textColor: Colors.white,
                    borderColor: Colors.black,
                  ),
                ),
              ])
            ]),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: attrs,
    );
  }

  int calculateE() {
    return 20 +
        r(0) -
        r(5) +
        r(10) -
        r(15) +
        r(20) -
        r(25) +
        r(30) -
        r(35) +
        r(40) -
        r(45);
  }

  int calculateA() {
    return 14 -
        r(1) +
        r(6) -
        r(11) +
        r(16) -
        r(21) +
        r(26) -
        r(31) +
        r(36) +
        r(41) +
        r(46);
  }

  int calculateC() {
    return 14 +
        r(2) -
        r(7) +
        r(12) -
        r(17) +
        r(22) -
        r(27) +
        r(32) -
        r(37) +
        r(42) +
        r(47);
  }

  int calculateN() {
    return 38 -
        r(3) +
        r(8) -
        r(13) +
        r(18) -
        r(23) -
        r(28) -
        r(33) -
        r(38) -
        r(43) -
        r(48);
  }

  int calculateO() {
    return 8 +
        r(4) -
        r(9) +
        r(14) -
        r(19) +
        r(24) -
        r(29) +
        r(34) +
        r(39) +
        r(44) +
        r(49);
  }
}

class PersAttribute {
  Color color;
  String label;
  int val;

  PersAttribute(this.color, this.label, this.val);
}

class ResponseButton {
  Color color;
  int value;

  ResponseButton(this.color, this.value);
}
