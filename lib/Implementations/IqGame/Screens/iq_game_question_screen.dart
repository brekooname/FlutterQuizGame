import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/iq_game_game_type_creator.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/quiz_question_container.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Game/Question/Model/question_info.dart';
import '../Components/iq_game_level_header.dart';
import '../Service/iq_game_local_storage.dart';

class IqGameQuestionScreen
    extends GameScreen<IqGameContext, IqGameScreenManagerState> {
  IqGameGameTypeCreator iqGameGameTypeCreator;
  IqGameLocalStorage iqGameLocalStorage = IqGameLocalStorage();

  IqGameQuestionScreen(
    this.iqGameGameTypeCreator,
    IqGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionDifficulty difficulty,
    required QuestionCategory category,
    required IqGameContext gameContext,
  }) : super(
            gameScreenManagerState,
            IqGameCampaignLevelService(),
            gameContext,
            difficulty,
            category,
            [
              getCurrentQuestionInfo(
                  gameScreenManagerState,
                  gameContext,
                  category,
                  gameContext.gameUser
                      .getOpenQuestionsForConfig(difficulty, category),
                  gameContext.skippedQuestions),
            ],
            key: key);

  @override
  State<IqGameQuestionScreen> createState() => IqGameQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 8;
  }

  static QuestionInfo getCurrentQuestionInfo(
      IqGameScreenManagerState gameScreenManagerState,
      IqGameContext gameContext,
      QuestionCategory category,
      Iterable<QuestionInfo> allOpenQuestion,
      List<QuestionInfo> skippedQuestions) {
    QuestionInfo? currentQuestionInfo;
    for (QuestionInfo q in allOpenQuestion) {
      if (!skippedQuestions.contains(q)) {
        currentQuestionInfo = q;
        break;
      }
    }
    var openSkippedQuestions =
        skippedQuestions.where((element) => element.isQuestionOpen());
    if (currentQuestionInfo == null && openSkippedQuestions.isNotEmpty) {
      currentQuestionInfo = openSkippedQuestions.first;
    }
    return currentQuestionInfo!;
  }
}

class IqGameQuestionScreenState extends State<IqGameQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget.iqGameGameTypeCreator.initGameTypeCreator(widget.currentQuestionInfo,
        refreshScreen: setStateCallback, goToNextScreen: () {
      nextQuestion();
    }, goToGameOverScreen: () {
      widget.gameScreenManagerState.setCurrentScreenState(widget
          .gameScreenManagerState
          .createGameOverScreen(widget.gameContext));
    });
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = widget.iqGameGameTypeCreator
        .getBackgroundColor(widget.currentQuestionInfo.question);
    return Container(
        color: backgroundColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IqGameLevelHeader(
                questionInfoStatus: widget.currentQuestionInfo.status,
                nextQuestion:
                    widget.iqGameGameTypeCreator.hasGoToNextQuestionBtn()
                        ? () {
                            nextQuestion();
                          }
                        : null,
                skipQuestion: widget.iqGameGameTypeCreator.hasSkipButton()
                    ? () {
                        nextQuestion();
                      }
                    : null,
                restartLevel: () {
                  restartCategory();
                },
                score: widget.iqGameGameTypeCreator.showScore()
                    ? widget.iqGameGameTypeCreator.getScore()
                    : null,
              ),
              const Spacer(),
              widget.iqGameGameTypeCreator.createGameContainerWithDecoration(
                context,
              ),
              const Spacer(),
            ]));
  }

  void restartCategory() {
    widget.iqGameLocalStorage.putAnsweredQuestions({}, widget.category);
    widget.gameScreenManagerState.showNewGameScreen(widget.campaignLevel);
  }

  void nextQuestion() {
    widget.gameContext.skipQuestion(widget.currentQuestionInfo);
    widget.gameScreenManagerState
        .showNextGameScreen(widget.campaignLevel, widget.gameContext);
  }

  void setStateCallback() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.iqGameGameTypeCreator.disposeGameTypeCreator();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
