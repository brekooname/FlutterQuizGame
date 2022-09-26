import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/game_local_storage.dart';

import '../../../Game/Question/Model/question.dart';
import '../../../main.dart';
import '../../Popup/my_popup.dart';
import '../../Popup/next_question_with_explanation_popup.dart';
import 'game_screen_manager_state.dart';

abstract class GameScreen<
        TGameContext extends GameContext,
        TGameScreenManagerState extends GameScreenManagerState,
        TCampaignLevelService extends CampaignLevelService>
    extends StandardScreen<TGameScreenManagerState> with LabelMixin {
  GameLocalStorage gameLocalStorage = GameLocalStorage();
  TGameContext gameContext;
  final List<QuestionInfo> _currentQuestionInfos;

  GameScreen(TGameScreenManagerState gameScreenManagerState, this.gameContext,
      this._currentQuestionInfos,
      {Key? key})
      : super(gameScreenManagerState, key: key) {
    incrementTotalPlayedQuestions();
  }

  TCampaignLevelService get campaignLevelService;

  void incrementTotalPlayedQuestions() {
    gameLocalStorage.incrementTotalPlayedQuestions();
  }

  QuestionInfo get currentQuestionInfo {
    if (_currentQuestionInfos.length != 1) {
      throw UnsupportedError(
          "!!!! DON'T USE !!!! THIS METHOD. There is more than 1 current question info.");
    }
    return _currentQuestionInfos.first;
  }

  QuestionDifficulty get difficulty =>
      listOfCurrentQuestionInfo.first.question.difficulty;

  QuestionCategory get category =>
      listOfCurrentQuestionInfo.first.question.category;

  CampaignLevel get campaignLevel =>
      campaignLevelService.campaignLevel(difficulty, category);

  List<QuestionInfo> get listOfCurrentQuestionInfo => _currentQuestionInfos;

  int nrOfQuestionsToShowInterstitialAd();

  void goToNextGameScreen() {
    var playedQ = gameLocalStorage.getTotalPlayedQuestions();
    var showOnNrOfQ = nrOfQuestionsToShowInterstitialAd();
    var showInterstitialAd = playedQ > 0 && playedQ % showOnNrOfQ == 0;
    adService.showInterstitialAd(showInterstitialAd, executeAfterClose: () {
      gameScreenManagerState.showNextGameScreen(campaignLevel, gameContext);
    });
  }

  VoidCallback processNextGameScreenCallBack(
      {VoidCallback? refreshScreenAfterExtraContentPurchase}) {
    return () {
      if (listOfCurrentQuestionInfo.length != 1 ||
          currentQuestionInfo
              .question.questionExplanationToBeDisplayed.isEmpty) {
        _goToNextGameScreenCallBack().call();
      } else {
        Question question = currentQuestionInfo.question;

        Widget popup = _createNextQuestionWithExplanationPopup(
            title:
                question.questionService.getCorrectAnswers(question).join(", "),
            explanation: question.questionExplanationToBeDisplayed,
            nextQuestionBtnLabel:
                gameContext.gameUser.getOpenQuestions().isEmpty
                    ? label.l_go_back
                    : label.l_next_question,
            refreshScreenAfterExtraContentPurchase:
                refreshScreenAfterExtraContentPurchase);

        MyPopup.showPopup(popup);
      }
    };
  }

  Widget _createNextQuestionWithExplanationPopup(
      {required String title,
      required String explanation,
      required String nextQuestionBtnLabel,
      required VoidCallback? refreshScreenAfterExtraContentPurchase}) {
    return MyApp.isExtraContentLocked
        ? NextQuestionWithExplanationPopup(
            title: title,
            explanation: explanation,
            goToNextScreen: _goToNextGameScreenCallBack(),
            refreshScreenAfterExtraContentPurchase:
                refreshScreenAfterExtraContentPurchase,
            nextQuestionBtnLabel: nextQuestionBtnLabel)
        : ExplanationPopup(
            title: title,
            explanation: explanation,
            goToNextScreen: _goToNextGameScreenCallBack(),
            nextQuestionBtnLabel: nextQuestionBtnLabel);
  }

  VoidCallback _goToNextGameScreenCallBack() {
    return () {
      goToNextGameScreen();
    };
  }
}
