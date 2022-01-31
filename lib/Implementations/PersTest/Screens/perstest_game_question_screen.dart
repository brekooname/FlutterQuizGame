import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Implementations/GeoQuiz/Constants/geoquiz_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Components/perstest_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Questions/perstest_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/PersTest/Service/perstest_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Font/font_config.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class PersTestQuestionScreen
    extends GameScreen<PersTestGameContext, PersTestGameScreenManagerState> {
  PersTestQuestionScreen(
    PersTestGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required PersTestGameContext gameContext,
  }) : super(gameScreenManagerState, GeoQuizCampaignLevelService(), gameContext,
            difficulty, category, [gameContext.currentQuestionInfo],
            key: key);

  @override
  State<PersTestQuestionScreen> createState() => PersTestQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }
}

class PersTestQuestionScreenState extends State<PersTestQuestionScreen>
    with ScreenState, QuizQuestionContainer {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PersTestLevelHeader(
            (widget.currentQuestionInfo.question.index + 1).toString() +
                "/" +
                widget.gameContext.gameUser.countAllQuestions([]).toString()),
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
      text: widget.currentQuestionInfo.question.rawString,
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
    var currentQIndex = widget.currentQuestionInfo.question.index;
    return SizedBox(
        width: btnSideDimen,
        child: MyButton(
          visible: goPreviousQuestion && currentQIndex != 0 ||
              !goPreviousQuestion &&
                  currentQIndex !=
                      widget.gameContext.gameUser.countAllQuestions([]) - 1 &&
                  widget.currentQuestionInfo.status == QuestionInfoStatus.won,
          onClick: () {
            QuestionInfo goToQuestion = widget.gameContext.gameUser
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
    var currentQuestionInfo = widget.currentQuestionInfo;
    for (ResponseButton r in responseBtns) {
      List<Widget> stackBtn = [];
      stackBtn.add(MyButton(
        onClick: () {
          currentQuestionInfo.clearPressedAnswers();
          currentQuestionInfo.addPressedAnswer(r.value.toString());
          widget.gameContext.gameUser.setWonQuestion(currentQuestionInfo);
          goToQuestionInfo(
              widget.gameContext.gameUser.getOpenQuestions().isEmpty
                  ? null
                  : widget.gameContext.gameUser.getOpenQuestions().first);
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
      widget.gameScreenManagerState.showGameOverScreen(
          widget.gameContext, widget.difficulty, widget.category);
    } else {
      widget.gameContext.currentQuestionInfo = questionInfo;
      widget.gameScreenManagerState
          .showNextGameScreen(widget.campaignLevel, widget.gameContext);
    }
  }

  void setStateCallback() {
    setState(() {});
  }
}

class ResponseButton {
  Color color;
  int value;

  ResponseButton(this.color, this.value);
}
