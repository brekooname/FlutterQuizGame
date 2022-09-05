import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_age_popup.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Constants/perstest_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Screens/GameType/perstest_game_type_play.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Extensions/string_extension.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/my_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestGameTypePlayFiveOptions extends PersTestGameTypePlay {
  PersTestGameTypePlayFiveOptions(
      GameScreen gameScreen, CampaignLevel campaignLevel)
      : super(gameScreen, campaignLevel);

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
            context, currentQuestionInfo, gameContext, gameScreenManagerState),
        SizedBox(height: screenDimensions.dimen(5)),
        _createResponseLabels(),
        _createResponseButtons(
            context, currentQuestionInfo, gameContext, gameScreenManagerState),
        const Spacer(),
      ],
    );
  }

  Widget _createQuestionContainer(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
    List<Widget> children = [];
    children.add(_createPreviousNextButton(context, true, currentQuestionInfo,
        gameContext, gameScreenManagerState));
    children.add(SizedBox(
        child: MyText(
      width: screenDimensions.w(75),
      maxLines: 4,
      fontSize: FontConfig.bigFontSize,
      text: currentQuestionInfo.question.rawString.capitalized,
    )));
    children.add(_createPreviousNextButton(context, false, currentQuestionInfo,
        gameContext, gameScreenManagerState));
    return SizedBox(
        height: screenDimensions.dimen(30),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children));
  }

  Widget _createPreviousNextButton(
      BuildContext context,
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
                context, goToQuestion, gameContext, gameScreenManagerState);
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
    var labelWidth = screenDimensions.w(28);
    int i = 0;
    Color labelColor;
    for (String l in [
      label.l_disagree,
      label.l_neither_agree_nor_disagree,
      label.l_agree
    ]) {
      if (i == 0) {
        labelColor = Colors.red.shade200;
        labels.add(const Spacer());
      } else if (i == 1) {
        labelColor = Colors.yellow;
        labels.add(const Spacer());
      } else {
        labelColor = Colors.green.shade200;
        labels.add(const Spacer());
      }
      labels.add(SizedBox(
          width: labelWidth,
          child: MyText(
            maxLines: 2,
            fontConfig: FontConfig(
                fontColor: labelColor,
                fontSize: FontConfig.getCustomFontSize(0.80),
                borderWidth: screenDimensions.dimen(0.5),
                borderColor: Colors.black),
            text: l.capitalized,
          )));
      i++;
    }
    labels.add(const Spacer());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: labels,
    );
  }

  Widget _createResponseButtons(
      BuildContext context,
      QuestionInfo currentQuestionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
    bool positiveResponseValue = gameTypeReport.isPositiveResponseValue();
    var responseBtns = [
      ResponseButton(Colors.red, positiveResponseValue ? 0 : -2),
      ResponseButton(Colors.orange, positiveResponseValue ? 1 : -1),
      ResponseButton(Colors.yellow, positiveResponseValue ? 2 : 0),
      ResponseButton(ColorUtil.colorDarken(Colors.lightGreenAccent, 0.1),
          positiveResponseValue ? 3 : 1),
      ResponseButton(Colors.green, positiveResponseValue ? 4 : 2)
    ];
    var btnSideDimen = screenDimensions.dimen(18);
    List<Widget> btns = [];
    var vertPadding = screenDimensions.dimen(2);
    var horizPadding = screenDimensions.dimen(6);
    for (ResponseButton r in responseBtns) {
      List<Widget> stackBtn = [];
      stackBtn.add(MyButton(
        onClick: () {
          currentQuestionInfo.clearPressedAnswers();
          currentQuestionInfo.addPressedAnswer(r.value.toString());

          audioPlayer.playClick();
          gameContext.gameUser.setWonQuestion(currentQuestionInfo);
          _goToQuestionInfo(
              context,
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
          padding: EdgeInsets.fromLTRB(
              horizPadding, vertPadding, horizPadding, vertPadding),
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
      BuildContext context,
      QuestionInfo? questionInfo,
      PersTestGameContext gameContext,
      PersTestGameScreenManagerState gameScreenManagerState) {
    if (questionInfo == null) {
      gameTypeReport.storeResultsToStorage(gameContext);
      if (category == PersTestGameQuestionConfig().cat1) {
        MyPopup.showPopup(PersTestAgePopup(() {
          showGameOverScreen(gameScreenManagerState);
        }));
      } else {
        showGameOverScreen(gameScreenManagerState);
      }
    } else {
      gameContext.currentQuestionInfo = questionInfo;
      gameScreen.goToNextGameScreen(context);
    }
  }

  void showGameOverScreen(
      PersTestGameScreenManagerState gameScreenManagerState) {
    gameScreenManagerState.showGameOverScreen(difficulty, category);
  }
}

class ResponseButton {
  Color color;
  int value;

  ResponseButton(this.color, this.value);
}
