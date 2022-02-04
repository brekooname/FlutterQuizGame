
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_attr_description_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_play.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_back_button.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/ProgressBar/progress_bar.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameTypeBigFivePlay extends PersTestGameTypePlay {
  final int _gameOverMaxScoreVal = 40;
  final PersTestLocalStorage _persTestLocalStorage = PersTestLocalStorage();

  PersTestGameTypeBigFivePlay(CampaignLevel campaignLevel)
      : super(campaignLevel);

  @override
  Widget createGamePlayContent(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PersTestLevelHeader(
            (currentQuestionInfo.question.index + 1).toString() +
                "/" +
                gameContext.gameUser.countAllQuestions([]).toString()),
        const Spacer(),
        _createQuestionContainer(
            currentQuestionInfo, gameContext, gameScreenManagerState),
        SizedBox(height: screenDimensions.dimen(10)),
        _createResponseLabels(),
        _createResponseButtons(
            currentQuestionInfo, gameContext, gameScreenManagerState),
        const Spacer(),
      ],
    );
  }

  Widget _createQuestionContainer(
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
    List<Widget> children = [];
    children.add(_createPreviousNextButton(
        true, currentQuestionInfo, gameContext, gameScreenManagerState));
    children.add(SizedBox(
        child: MyText(
      width: screenDimensions.w(75),
      maxLines: 4,
      fontSize: FontConfig.bigFontSize,
      text: currentQuestionInfo.question.rawString,
    )));
    children.add(_createPreviousNextButton(
        false, currentQuestionInfo, gameContext, gameScreenManagerState));
    return SizedBox(
        height: screenDimensions.dimen(30),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children));
  }

  Widget _createPreviousNextButton(
      bool goPreviousQuestion,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
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
            _goToQuestionInfo(
                goToQuestion, gameContext, gameScreenManagerState);
          },
          size: Size(btnSideDimen, btnSideDimen),
          buttonSkinConfig: ButtonSkinConfig(
              image: imageService.getSpecificImage(
                  module: "buttons",
                  imageName: goPreviousQuestion ? "left_arrow" : "right_arrow",
                  imageExtension: "png")),
        ));
  }

  Widget _createResponseLabels() {
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

  Widget _createResponseButtons(
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
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
          _goToQuestionInfo(
              gameContext.gameUser.getOpenQuestions().isEmpty
                  ? null
                  : gameContext.gameUser.getOpenQuestions().first,
              gameContext,
              gameScreenManagerState);
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

  void _goToQuestionInfo(
      QuestionInfo? questionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
    if (questionInfo == null) {
      storeResultsToStorage(gameContext);
      gameScreenManagerState.showGameOverScreen(difficulty, category);
    } else {
      gameContext.currentQuestionInfo = questionInfo;
      gameScreenManagerState.showNextGameScreen(campaignLevel, gameContext);
    }
  }

  @override
  Widget createResultsReportContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [MyBackButton(), const Spacer()]),
        const Spacer(),
        _createAttributes(context),
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

  @override
  void storeResultsToStorage(PersTestGameContext gameContext) {
    _persTestLocalStorage.storeGameTypeResults(difficulty, category, [
      PersTestGameTypeAttrStorage("e", calculateE(gameContext).toString()),
      PersTestGameTypeAttrStorage("a", calculateA(gameContext).toString()),
      PersTestGameTypeAttrStorage("c", calculateC(gameContext).toString()),
      PersTestGameTypeAttrStorage("n", calculateN(gameContext).toString()),
      PersTestGameTypeAttrStorage("o", calculateO(gameContext).toString()),
    ]);
  }

  Widget _createAttributes(BuildContext context) {
    List<PersTestGameTypeAttrStorage> storageAttrs =
        _persTestLocalStorage.getGameTypeResults(difficulty, category);
    List<PersAttribute> attrVals = [
      PersAttribute(Colors.lightGreenAccent, "Extroversion",
          getAttrIntValue("e", storageAttrs)),
      PersAttribute(
          Colors.red, "Emotional stabielt", getAttrIntValue("a", storageAttrs)),
      PersAttribute(Colors.tealAccent, "Agreeablesnn",
          getAttrIntValue("c", storageAttrs)),
      PersAttribute(Colors.purpleAccent, "Consitoniouss",
          getAttrIntValue("n", storageAttrs)),
      PersAttribute(Colors.blue, "Intellect/Imagination",
          getAttrIntValue("o", storageAttrs)),
    ];

    List<Widget> attrs = [];
    var attrBarWidth = screenDimensions.dimen(90);
    var btnSize = Size(screenDimensions.dimen(90), screenDimensions.dimen(13));
    var padding = screenDimensions.dimen(0.8);
    for (PersAttribute r in attrVals) {
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

  int getAttrIntValue(
      String key, List<PersTestGameTypeAttrStorage> storageAttrs) {
    return storageAttrs
        .where((e) => e.attrKey == key)
        .first
        .attrValue
        .parseToInt;
  }

  int r(PersTestGameContext gameContext, int qNr) {
    // return Random().nextInt(5) + 1;
    return gameContext.gameUser
            .getAllQuestions([])
            .where((element) => element.question.index == qNr)
            .first
            .pressedAnswers
            .first
            .parseToInt +
        1;
  }

  int calculateE(PersTestGameContext gameContext) {
    return 20 +
        r(gameContext, 0) -
        r(gameContext, 5) +
        r(gameContext, 10) -
        r(gameContext, 15) +
        r(gameContext, 20) -
        r(gameContext, 25) +
        r(gameContext, 30) -
        r(gameContext, 35) +
        r(gameContext, 40) -
        r(gameContext, 45);
  }

  int calculateA(PersTestGameContext gameContext) {
    return 14 -
        r(gameContext, 1) +
        r(gameContext, 6) -
        r(gameContext, 11) +
        r(gameContext, 16) -
        r(gameContext, 21) +
        r(gameContext, 26) -
        r(gameContext, 31) +
        r(gameContext, 36) +
        r(gameContext, 41) +
        r(gameContext, 46);
  }

  int calculateC(PersTestGameContext gameContext) {
    return 14 +
        r(gameContext, 2) -
        r(gameContext, 7) +
        r(gameContext, 12) -
        r(gameContext, 17) +
        r(gameContext, 22) -
        r(gameContext, 27) +
        r(gameContext, 32) -
        r(gameContext, 37) +
        r(gameContext, 42) +
        r(gameContext, 47);
  }

  int calculateN(PersTestGameContext gameContext) {
    return 38 -
        r(gameContext, 3) +
        r(gameContext, 8) -
        r(gameContext, 13) +
        r(gameContext, 18) -
        r(gameContext, 23) -
        r(gameContext, 28) -
        r(gameContext, 33) -
        r(gameContext, 38) -
        r(gameContext, 43) -
        r(gameContext, 48);
  }

  int calculateO(PersTestGameContext gameContext) {
    return 8 +
        r(gameContext, 4) -
        r(gameContext, 9) +
        r(gameContext, 14) -
        r(gameContext, 19) +
        r(gameContext, 24) -
        r(gameContext, 29) +
        r(gameContext, 34) +
        r(gameContext, 39) +
        r(gameContext, 44) +
        r(gameContext, 49);
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
