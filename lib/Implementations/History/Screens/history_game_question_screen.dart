import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Game/Question/QuestionCategoryService/question_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Components/history_game_level_header.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Constants/history_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Questions/history_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/History/Service/history_game_local_storage.dart';
import 'package:flutter_app_quiz_game/Lib/Button/button_skin_config.dart';
import 'package:flutter_app_quiz_game/Lib/Button/my_button.dart';
import 'package:flutter_app_quiz_game/Lib/Color/color_util.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/game_screen_manager_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Text/my_text.dart';

import 'history_game_timeline_screen.dart';

class HistoryGameQuestionScreen extends StandardScreen
    with GameScreen<HistoryGameContext> {
  late HistoryLocalStorage historyLocalStorage;
  late QuestionInfo? currentQuestionInfo;
  late QuestionService questionService;
  bool correctAnswerPressed = false;
  String? wrongPressedAnswer;
  Set<String> hintDisabledPossibleAnswers = HashSet();
  Set<String> possibleAnswers = HashSet();

  HistoryGameQuestionScreen(
    GameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required HistoryGameContext gameContext,
  }) : super(gameScreenManagerState, key: key) {
    initScreen(
      HistoryCampaignLevelService(),
      gameContext,
      difficulty,
      category,
    );
    historyLocalStorage = HistoryLocalStorage();

    currentQuestionInfo =
        gameContext.gameUser.getRandomQuestion(difficulty, category);
    gameLocalStorage.incrementTotalPlayedQuestions();

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
    with ScreenState {
  @override
  void initState() {
    super.initState();
    initScreen(onUserEarnedReward: () {
      onHintButtonClick();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          header,
          createImageContainer(currentQuestionInfo.question),
          btnContainer
        ],
      );

      return mainColumn;
    } else {
      return Container();
    }
  }

  Widget createImageContainer(Question question) {
    return Expanded(
        child: Container(
            child: imageService.getSpecificImage(
                module: getQuestionImagePath(
                    question.difficulty, question.category),
                imageExtension: "jpeg",
                imageName: "i" + question.index.toString())));
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
                  widget.historyLocalStorage
                      .setWonQuestion(questionInfo.question);
                } else {
                  audioPlayer.playFail();
                  widget.wrongPressedAnswer = answerBtnText;
                  widget.gameContext.gameUser.setLostQuestion(questionInfo);
                  widget.historyLocalStorage
                      .setLostQuestion(questionInfo.question);
                }
              });

              Future.delayed(Duration(milliseconds: 1100),
                  () => goToNextGameScreen(context));
            },
            buttonSkinConfig: ButtonSkinConfig(
                borderColor: ColorUtil.colorDarken(btnBackgr, 0.1),
                backgroundColor: btnBackgr),
            customContent: MyText(
              text: answerBtnText,
              maxLines: 4,
              width: btnSize.width / 1.1,
            )));
  }

  void goToNextGameScreen(BuildContext context) {
    var playedQ = widget.gameLocalStorage.getTotalPlayedQuestions();
    var showOnNrOfQ =
        HistoryGameTimelineScreen.show_interstitial_ad_every_n_questions;
    adService.showInterstitialAd(
        context, playedQ > 0 && playedQ % showOnNrOfQ == 0, () {
      widget.gameScreenManagerState
          .showNextGameScreen(widget.campaignLevel, widget.gameContext);
    });
  }

  HistoryGameLevelHeader createHeader(QuestionInfo questionInfo) {
    var header = HistoryGameLevelHeader(
      onBackButtonClick: () {
        widget.gameScreenManagerState.goBack(widget);
      },
      campaignLevel: widget.campaignLevel,
      availableHints: widget.gameContext.amountAvailableHints,
      question: questionInfo.question,
      animateScore: widget.correctAnswerPressed,
      disableHintBtn: widget.hintDisabledPossibleAnswers.isNotEmpty,
      score: formatTextWithOneParam(
          label.l_score_param0,
          widget.historyLocalStorage
                  .getWonQuestions(widget.difficulty)
                  .length
                  .toString() +
              "/" +
              widget.gameContext.totalNrOfQuestionsForCampaignLevel.toString()),
      hintButtonOnClick: () {
        onHintButtonClick();
      },
    );
    return header;
  }

  String getQuestionImagePath(
          QuestionDifficulty difficulty, QuestionCategory category) =>
      "questions/images/" + difficulty.name + "/" + category.name;

  void onHintButtonClick() {
    if (widget.currentQuestionInfo != null) {
      widget.gameContext.amountAvailableHints--;
      widget.historyLocalStorage.setRemainingHints(
          widget.difficulty, widget.gameContext.amountAvailableHints);

      var optionsToDisable = List.of(widget.possibleAnswers);
      optionsToDisable.shuffle();
      optionsToDisable
          .remove(widget.currentQuestionInfo!.question.correctAnswer);

      widget.hintDisabledPossibleAnswers
          .add(optionsToDisable.first.toLowerCase());
      widget.hintDisabledPossibleAnswers
          .add(optionsToDisable.last.toLowerCase());

      setState(() {});
    }
  }
}
