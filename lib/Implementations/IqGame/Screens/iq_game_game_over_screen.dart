import 'package:flutter/material.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Questions/iq_game_context.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Screens/GameType/iq_game_game_type_creator.dart';
import 'package:flutter_app_quiz_game/Implementations/IqGame/Service/iq_game_screen_manager.dart';
import 'package:flutter_app_quiz_game/Lib/Localization/label_mixin.dart';
import 'package:flutter_app_quiz_game/Lib/Screen/screen_state.dart';

import '../../../Lib/Popup/my_popup.dart';
import '../../../Lib/Screen/standard_screen.dart';
import '../Components/iq_game_iq_test_correct_answers_popup.dart';
import '../Components/iq_game_level_header.dart';
import '../Constants/iq_game_campaign_level_service.dart';
import '../Constants/iq_game_question_config.dart';

class IqGameGameOverScreen extends StandardScreen<IqGameScreenManagerState> {
  final IqGameGameTypeCreator _iqGameGameTypeCreator;
  final IqGameQuestionConfig _iqGameQuestionConfig = IqGameQuestionConfig();
  final IqGameContext _gameContext;

  IqGameGameOverScreen(
    this._iqGameGameTypeCreator,
    this._gameContext,
    IqGameScreenManagerState gameScreenManagerState, {
    Key? key,
  }) : super(gameScreenManagerState, key: key);

  @override
  State<IqGameGameOverScreen> createState() => IqGameGameOverScreenState();

  @override
  Color? get screenBackgroundColor => Colors.white;
}

class IqGameGameOverScreenState extends State<IqGameGameOverScreen>
    with ScreenState, LabelMixin {
  @override
  void initState() {
    super.initState();
    widget._iqGameGameTypeCreator.initGameOverTypeCreator(
        refreshState: setStateCallback,
        restartCurrentScreenAfterExtraContentPurchase:
            _restartCurrentScreenAfterExtraContentPurchase,
        goToGameOverScreen: () {
          widget.gameScreenManagerState.showMainScreen();
        });
    widget._iqGameGameTypeCreator.executeOnGameOver();
  }

  void _restartCurrentScreenAfterExtraContentPurchase() {
    widget.gameScreenManagerState.setCurrentScreenState(widget
        .gameScreenManagerState
        .createGameOverScreen(widget._gameContext));

    if (widget._iqGameQuestionConfig.isIqTestCategory(
        widget._gameContext.questionConfig.categories.first)) {
      Future.delayed(const Duration(milliseconds: 500), () {
        MyPopup.showPopup(IqGameIqTestCorrectAnswersPopup(
            widget._gameContext,
            widget._iqGameGameTypeCreator
                .getQuestionImageModuleName(widget._gameContext)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IqGameLevelHeader(restartLevel: () {
                widget.gameScreenManagerState.showNewGameScreen(
                    IqGameCampaignLevelService().campaignLevel(
                        widget._gameContext.questionConfig.difficulties.first,
                        widget._gameContext.questionConfig.categories.first));
              }),
              const Spacer(),
              widget._iqGameGameTypeCreator.createGameOverContainer(context),
              const Spacer(),
            ]));
  }

  void setStateCallback() {
    setState(() {});
  }
}
