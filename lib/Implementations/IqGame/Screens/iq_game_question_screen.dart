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

class IqGameQuestionScreen
    extends GameScreen<IqGameContext, IqGameScreenManagerState> {
  IqGameGameTypeCreator iqGameGameTypeCreator;

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
    if (currentQuestionInfo == null && skippedQuestions.isNotEmpty) {
      currentQuestionInfo = skippedQuestions.first;
    }
    return currentQuestionInfo!;
  }
}

class IqGameQuestionScreenState extends State<IqGameQuestionScreen>
    with ScreenState, QuizQuestionContainer, LabelMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IqGameLevelHeader(() {
                skipQuestion();
              }),
              const Spacer(),
              widget.iqGameGameTypeCreator.createGameContainer(
                  widget.currentQuestionInfo,
                  widget.gameContext,
                  widget.goToNextGameScreenCallBack(context)),
              const Spacer(),
            ]));
  }

  void skipQuestion() {
    widget.gameContext.skipQuestion(widget.currentQuestionInfo);
    widget.gameScreenManagerState
        .showNextGameScreen(widget.campaignLevel, widget.gameContext);
  }

  void setStateCallback() {
    setState(() {});
  }
}