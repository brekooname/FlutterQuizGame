import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level.dart';
import 'package:flutter_app_quiz_game/Game/Game/campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Game/Game/game_context.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_category.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_difficulty.dart';
import 'package:flutter_app_quiz_game/Game/Question/Model/question_info.dart';
import 'package:flutter_app_quiz_game/Lib/Ads/ad_service.dart';
import 'package:flutter_app_quiz_game/Lib/Image/image_service.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/standard_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Storage/game_local_storage.dart';

import 'game_screen_manager_state.dart';

abstract class GameScreen<TGameContext extends GameContext>
    extends StandardScreen {
  GameLocalStorage gameLocalStorage = GameLocalStorage();
  AdService adService = AdService();
  ImageService imageService = ImageService();
  late CampaignLevel campaignLevel;
  TGameContext gameContext;
  QuestionDifficulty difficulty;
  QuestionCategory category;
  final List<QuestionInfo> _currentQuestionInfos;

  GameScreen(
      GameScreenManagerState gameScreenManagerState,
      CampaignLevelService campaignLevelService,
      this.gameContext,
      this.difficulty,
      this.category,
      this._currentQuestionInfos,
      {Key? key})
      : super(gameScreenManagerState, key: key) {
    campaignLevel = campaignLevelService.campaignLevel(difficulty, category);
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
    adService.showInterstitialAd(
        context, playedQ > 0 && playedQ % showOnNrOfQ == 0, () {
      gameScreenManagerState.showNextGameScreen(campaignLevel, gameContext);
    });
  }

  VoidCallback goToNextGameScreenCallBack(BuildContext context) {
    return () {
      goToNextGameScreen(context);
    };
  }
}
