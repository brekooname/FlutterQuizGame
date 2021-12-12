import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info_status.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Popup/game_finished_popup.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

class HistoryGameQuestionScreen extends StatefulWidget
    with GameScreen<HistoryGameContext> {
  late HistoryLocalStorage historyLocalStorage;
  late QuestionInfo? currentQuestionInfo;
  late QuestionService questionService;
  bool correctAnswerPressed = false;
  String? wrongPressedAnswer;
  Set<String> hintDisabledPossibleAnswers = HashSet();
  Set<String> possibleAnswers = HashSet();

  HistoryGameQuestionScreen(
      {Key? key,
      required QuestionDifficulty difficulty,
      required QuestionCategory category,
      required HistoryGameContext gameContext})
      : super(key: key) {
    initScreen(HistoryCampaignLevel(), gameContext, difficulty, category);
    historyLocalStorage = HistoryLocalStorage();

    currentQuestionInfo =
        gameContext.gameUser.getRandomQuestion(difficulty, category);

    if (currentQuestionInfo != null) {
      questionService = currentQuestionInfo!.question.questionService;
      var list = List.of(questionService
          .getAllAnswerOptionsForQuestion(currentQuestionInfo!.question));
      list.shuffle();
      possibleAnswers = HashSet.of(list);
    }
  }

  @override
  State<HistoryGameQuestionScreen> createState() =>
      HistoryGameQuestionScreenState();
}

class HistoryGameQuestionScreenState extends State<HistoryGameQuestionScreen>
    with StandardScreen {
  @override
  Widget build(BuildContext context) {
    initScreen(context);

    if (widget.currentQuestionInfo != null) {
      var currentQuestionInfo = widget.currentQuestionInfo!;
      HistoryGameLevelHeader header = createHeader(currentQuestionInfo);

      List<Row> answerRows = [];
      int answersOnRow = 2;
      List<Widget> answerBtns = [];
      for (String possibleAnswer in widget.possibleAnswers) {
        answerBtns.add(
            createPossibleAnswerButton(currentQuestionInfo, possibleAnswer));
        if (answerBtns.length == answersOnRow) {
          answerRows.add(Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: answerBtns,
          ));
          answerBtns = [];
        }
      }
      answerRows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: answerBtns,
      ));
      Widget btnContainer = Expanded(
          child: Column(
        children: answerRows,
      ));

      var mainColumn = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[header, createImageContainer(), btnContainer],
      );

      return createScreen(mainColumn);
    } else {
      return createScreen(Container());
    }
  }

  Widget createImageContainer() {
    return Expanded(
        child: Container(
            child: imageService.getSpecificImage(
                imageName: "timeline_opt_unknown")));
  }

  Widget createPossibleAnswerButton(
      QuestionInfo questionInfo, String answerBtnText) {
    var btnBackgr = Colors.lightBlueAccent;
    var btnSize = Size(screenDimensions.w(45), screenDimensions.h(15));
    var disabled = widget.wrongPressedAnswer != null ||
        widget.correctAnswerPressed ||
        widget.hintDisabledPossibleAnswers
            .contains(answerBtnText.toLowerCase());

    var disabledBackgroundColor = widget.wrongPressedAnswer != null &&
            widget.wrongPressedAnswer!.toLowerCase() ==
                answerBtnText.toLowerCase()
        ? Colors.red
        : answerBtnText.toLowerCase() ==
                questionInfo.question.correctAnswer.toLowerCase()
            ? Colors.green
            : null;

    return Padding(
        padding: EdgeInsets.all(screenDimensions.w(1)),
        child: MyButton(
            size: btnSize,
            disabled: disabled,
            disabledBackgroundColor: disabledBackgroundColor,
            onClick: () {
              setState(() {
                if (questionInfo.question.questionService
                    .isAnswerCorrectInQuestion(
                        questionInfo.question, answerBtnText)) {
                  audioPlayer.playSuccess();
                  widget.correctAnswerPressed = true;
                  widget.gameContext.gameUser.setWonQuestion(questionInfo);
                } else {
                  audioPlayer.playFail();
                  widget.wrongPressedAnswer = answerBtnText;
                  widget.gameContext.gameUser.setLostQuestion(questionInfo);
                }
              });

              Future.delayed(
                  Duration(milliseconds: 1100),
                  () => {
                        HistoryGameScreenManager(buildContext: context)
                            .showNextGameScreen(
                                widget.campaignLevel, widget.gameContext)
                      });
            },
            buttonSkinConfig: ButtonSkinConfig(
                borderColor: ColorUtil.colorDarken(btnBackgr, 0.1),
                backgroundColor: btnBackgr),
            customContent: MyText(text: answerBtnText)));
  }

  HistoryGameLevelHeader createHeader(QuestionInfo questionInfo) {
    var header = HistoryGameLevelHeader(
      availableHints: widget.gameContext.amountAvailableHints,
      question: questionInfo.question,
      animateScore: widget.correctAnswerPressed,
      score: formatTextWithOneParam(
          label.l_score_param0,
          widget.gameContext.gameUser
              .countAllQuestions([QuestionInfoStatus.WON])),
      hintButtonOnClick: () {
        onHintButtonClick(questionInfo);
      },
      screenDimensions: screenDimensions,
    );
    return header;
  }

  String getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  GameFinishedPopup buildGameFinishedPopup(BuildContext context) {
    return GameFinishedPopup(
      isGameFinishedSuccess: true,
      highScore: null,
      playAgainClick: () {},
    );
  }

  void onHintButtonClick(QuestionInfo questionInfo) {
    widget.gameContext.amountAvailableHints =
        widget.gameContext.amountAvailableHints - 1;

    var optionsToDisable = List.of(widget.possibleAnswers);
    optionsToDisable.shuffle();
    optionsToDisable.remove(questionInfo.question.correctAnswer);

    widget.hintDisabledPossibleAnswers
        .add(optionsToDisable.first.toLowerCase());
    widget.hintDisabledPossibleAnswers.add(optionsToDisable.last.toLowerCase());

    setState(() {});
  }

  @override
  void dispose() {
    disposeScreen();
    super.dispose();
  }
}
