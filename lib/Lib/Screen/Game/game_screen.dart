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

  void goToNextGameScreen(BuildContext context) {
    var playedQ = gameLocalStorage.getTotalPlayedQuestions();
    var showOnNrOfQ = nrOfQuestionsToShowInterstitialAd();
    var showInterstitialAd = playedQ > 0 && playedQ % showOnNrOfQ == 0;
    adService.showInterstitialAd(context, showInterstitialAd,
        executeAfterClose: () {
      gameScreenManagerState.showNextGameScreen(campaignLevel, gameContext);
    });
  }

  VoidCallback goToNextGameScreenCallBack(BuildContext context) {
    return () {
      if (listOfCurrentQuestionInfo.length != 1 ||
          currentQuestionInfo
              .question.questionExplanationToBeDisplayed.isEmpty) {
        _goToNextGameScreenCallBack(context).call();
      } else {
        Question question = currentQuestionInfo.question;
        var popup = NextQuestionWithExplanationPopup(
            question.questionService.getCorrectAnswers(question).join(", "),
            question.questionExplanationToBeDisplayed,
            _goToNextGameScreenCallBack(context),
            gameContext.gameUser.getOpenQuestions().isEmpty
                ? label.l_go_back
                : label.l_next_question);
        MyPopup.showPopup(context, popup);
      }
    };
  }

  VoidCallback _goToNextGameScreenCallBack(BuildContext context) {
    return () {
      goToNextGameScreen(context);
    };
  }
}
