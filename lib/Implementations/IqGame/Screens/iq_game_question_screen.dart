import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_campaign_level_service.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Constants/iq_game_question_config.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/iq_game_game_type_creator.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/Game/game_screen.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Game/Question/Model/question_info.dart';
import '../../../Lib/Popup/buy_pro_popup.dart';
import '../../../Lib/Popup/my_popup.dart';
import '../../../main.dart';
import '../Components/iq_game_level_header.dart';
import '../Service/iq_game_local_storage.dart';
import 'GameType/NumberSeq/iq_game_number_seq_game_type_creator.dart';

class IqGameQuestionScreen extends GameScreen<IqGameContext,
    IqGameScreenManagerState, IqGameCampaignLevelService> {
  final IqGameGameTypeCreator _iqGameGameTypeCreator;
  final IqGameLocalStorage _iqGameLocalStorage = IqGameLocalStorage();
  final IqGameQuestionConfig _iqGameQuestionConfig = IqGameQuestionConfig();

  IqGameQuestionScreen(
    this._iqGameGameTypeCreator,
    IqGameScreenManagerState gameScreenManagerState, {
    Key? key,
    required QuestionInfo questionInfo,
    required IqGameContext gameContext,
  }) : super(gameScreenManagerState, gameContext, [questionInfo], key: key);

  @override
  IqGameCampaignLevelService get campaignLevelService =>
      IqGameCampaignLevelService();

  @override
  State<IqGameQuestionScreen> createState() => IqGameQuestionScreenState();

  @override
  int nrOfQuestionsToShowInterstitialAd() {
    return 12;
  }

  @override
  Color? get screenBackgroundColor =>
      _iqGameGameTypeCreator.getBackgroundColor(currentQuestionInfo.question);
}

class IqGameQuestionScreenState extends State<IqGameQuestionScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget._iqGameGameTypeCreator.initGameTypeCreator(
        widget.currentQuestionInfo,
        refreshState: setStateCallback,
        restartCurrentScreenAfterExtraContentPurchase:
            _restartCurrentScreenAfterExtraContentPurchase, goToNextScreen: () {
      _nextQuestion();
    }, goToGameOverScreen: () {
      widget.gameScreenManagerState.setCurrentScreenState(widget
          .gameScreenManagerState
          .createGameOverScreen(widget.gameContext));
    });

    var qIndex = widget.currentQuestionInfo.question.index;
    if (MyApp.isExtraContentLocked) {
      if (widget._iqGameQuestionConfig.isIqTestCategory(widget.category)) {
        if (qIndex == 9) {
          MyPopup.showPopup(BuyProPopup());
        }
      } else if (widget._iqGameQuestionConfig
          .isNumberSeqCategory(widget.category)) {
        if (qIndex == 6) {
          MyPopup.showPopup(BuyProPopup());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IqGameLevelHeader(
            questionInfoStatus: widget.currentQuestionInfo.status,
            nextQuestion: widget._iqGameGameTypeCreator.hasGoToNextQuestionBtn()
                ? () {
                    _nextQuestion();
                  }
                : null,
            skipQuestion: widget._iqGameGameTypeCreator.hasSkipButton()
                ? () {
                    _nextQuestion();
                  }
                : null,
            restartLevel: () {
              _restartCategory();
            },
            score: widget._iqGameGameTypeCreator.showScore()
                ? widget._iqGameGameTypeCreator.getScore()
                : null,
          ),
          const Spacer(),
          widget._iqGameGameTypeCreator.createGameContainerWithDecoration(
            context,
          ),
          const Spacer(),
        ]);
  }

  void _restartCurrentScreenAfterExtraContentPurchase() {
    widget.gameScreenManagerState.setCurrentScreenState(IqGameQuestionScreen(
        widget._iqGameGameTypeCreator, widget.gameScreenManagerState,
        key: UniqueKey(),
        gameContext: widget.gameContext,
        questionInfo: widget.currentQuestionInfo));

    if (widget._iqGameQuestionConfig.isNumberSeqCategory(widget.category)) {
      Future.delayed(const Duration(milliseconds: 500), () {
        (widget._iqGameGameTypeCreator as IqGameNumberSeqGameTypeCreator)
            .showExplanationPopup();
      });
    }
  }

  void _restartCategory() {
    widget._iqGameLocalStorage.putAnsweredQuestions({}, widget.category);
    widget.gameScreenManagerState.showNewGameScreen(widget.campaignLevel);
  }

  void _nextQuestion() {
    widget.gameContext.skipQuestion(widget.currentQuestionInfo);
    _goToNextGameScreen();
  }

  void _goToNextGameScreen() {
    var playedQ = widget.gameLocalStorage.getTotalPlayedQuestions();
    var showOnNrOfQ = widget.nrOfQuestionsToShowInterstitialAd();
    var qIndex = widget.currentQuestionInfo.question.index;
    var iqTestCategory =
        widget._iqGameQuestionConfig.isIqTestCategory(widget.category);
    var iqNumberSeqCategory =
        widget._iqGameQuestionConfig.isNumberSeqCategory(widget.category);
    var showInterstitialAd =
        (iqTestCategory && (qIndex == 20 || qIndex == 30)) ||
            (iqNumberSeqCategory && (qIndex == 12 || qIndex == 17)) ||
            (!iqTestCategory &&
                !iqNumberSeqCategory &&
                playedQ > 0 &&
                playedQ % showOnNrOfQ == 0);
    adService.showInterstitialAd(showInterstitialAd, executeAfterClose: () {
      widget.gameScreenManagerState
          .showNextGameScreen(widget.campaignLevel, widget.gameContext);
    });
  }

  void setStateCallback() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget._iqGameGameTypeCreator.disposeGameTypeCreator();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
