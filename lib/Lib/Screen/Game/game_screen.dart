import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Audio/my_audio_player.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/game_local_storage.dart';

import '../../../Game/Question/Model/question.dart';
import '../../Popup/my_popup.dart';
import '../../Popup/next_question_with_explanation_popup.dart';
import 'game_screen_manager_state.dart';

abstract class GameScreen<
        TGameContext extends GameContext,
        TGameScreenManagerState extends GameScreenManagerState,
        TCampaignLevelService extends CampaignLevelService>
    extends StandardScreen<TGameScreenManagerState> with LabelMixin {
  GameLocalStorage gameLocalStorage = GameLocalStorage();
  AdService adService = AdService();
  MyAudioPlayer audioPlayer = MyAudioPlayer();
  ImageService imageService = ImageService();
  TCampaignLevelService campaignLevelService;
  late CampaignLevel campaignLevel;
  TGameContext gameContext;
  QuestionDifficulty difficulty;
  QuestionCategory category;
  final List<QuestionInfo> _currentQuestionInfos;

  GameScreen(
      TGameScreenManagerState gameScreenManagerState,
      this.campaignLevelService,
      this.gameContext,
      this.difficulty,
      this.category,
      this._currentQuestionInfos,
      {Key? key})
      : super(gameScreenManagerState, key: key) {
    campaignLevel = campaignLevelService.campaignLevel(difficulty, category);
    incrementTotalPlayedQuestions();
  }

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
        var nextQuestionBtnLabel =
            gameContext.gameUser.getOpenQuestions().isEmpty
                ? label.l_go_back
                : label.l_next_question;
        var title =
            question.questionService.getCorrectAnswers(question).join(", ");
        var popup = NextQuestionWithExplanationPopup(
            title: title,
            explanation: question.questionExplanationToBeDisplayed,
            goToNextScreen: _goToNextGameScreenCallBack(),
            refreshScreenAfterExtraContentPurchase:
                refreshScreenAfterExtraContentPurchase,
            nextQuestionBtnLabel: nextQuestionBtnLabel);
        MyPopup.showPopup(popup);
      }
    };
  }

  VoidCallback _goToNextGameScreenCallBack() {
    return () {
      goToNextGameScreen();
    };
  }
}
